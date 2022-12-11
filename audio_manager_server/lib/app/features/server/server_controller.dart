import 'dart:async';

import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jaguar/jaguar.dart';

import '../features.dart';

final serverControllerProvider = ChangeNotifierProvider(ServerController.new);

class ServerController extends ChangeNotifier {
  final AudioManagerService audioManagerService;
  final ServerService server;

  ServerController(Ref ref)
      : audioManagerService = ref.read(audioManagerServiceProvider),
        server = ref.read(serverServiceProvider) {
    ref.watch(networkInfoProvider);
  }

  bool get isRunning => server.isRunning;

  void init(NetworkInfo networkInfo) {
    server.init(networkInfo);
    notifyListeners();
  }

  Future<void> start() async {
    server.ws(
      '/connect',
      (_, __) {
        logInfo('New connection');
        return Stream.value(WebSocketHelper.connectedResponse);
      },
    );
    server.ws(
      '/output-devices',
      (context, _) => audioManagerService.getOutputDevicesStream().toJson(),
    );
    server.ws(
      '/input-devices',
      (request, _) => audioManagerService.getInputDevicesStream().toJson(),
    );
    server.ws(
      '/default-output-device',
      (_, __) => audioManagerService.getDefaultOutputDeviceStream().toJson(),
    );
    server.ws(
      '/default-input-device',
      (_, __) => audioManagerService.getDefaultInputDeviceStream().toJson(),
    );
    server.ws(
      '/volume',
      (_, __) => audioManagerService.getVolumeStream(),
    );
    server.ws(
      '/mic-volume',
      (_, __) => audioManagerService.getMicVolumeStream(),
    );
    server.ws(
      '/audio-mixer',
      (_, __) => audioManagerService.getAudioMixerStream().toJson(),
    );

    server.post(
      '/volume',
      (request) async {
        final volume = await request.getBodyParam<double>('volume');

        await audioManagerService.setVolume(volume);
        return Response.json({'Message': 'Volume set to $volume'});
      },
    );

    server.post(
      '/mic-volume',
      (request) async {
        final volume = await request.getBodyParam<double>('volume');

        await audioManagerService.setMicVolume(volume);
        return Response.json({'Message': 'Mic Volume set to $volume'});
      },
    );

    server.post(
      '/default-device',
      (request) async {
        final deviceId = await request.getBodyParam<String>('deviceId');

        await audioManagerService.setDefaultDevice(deviceId);
        return Response.json({'Message': 'Default output device set to $deviceId'});
      },
    );

    server.post(
      '/mixer-volume',
      (request) async {
        final deviceId = await request.getBodyParam<int>('deviceId');
        final volume = await request.getBodyParam<double>('volume');

        await audioManagerService.setMixerVolume(deviceId, volume);
        return Response.json({'Message': 'Mixer volume set to $volume'});
      },
    );

    await server.start();
    notifyListeners();
  }

  Future<void> stop() async {
    await server.stop();
    notifyListeners();
  }
}
