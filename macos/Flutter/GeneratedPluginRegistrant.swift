//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import amplify_secure_storage
import audio_session
import cloud_firestore
import firebase_auth
import firebase_core
import firebase_storage
import just_audio
import path_provider_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AmplifySecureStoragePlugin.register(with: registry.registrar(forPlugin: "AmplifySecureStoragePlugin"))
  AudioSessionPlugin.register(with: registry.registrar(forPlugin: "AudioSessionPlugin"))
  FLTFirebaseFirestorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseFirestorePlugin"))
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  FLTFirebaseStoragePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseStoragePlugin"))
  JustAudioPlugin.register(with: registry.registrar(forPlugin: "JustAudioPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
}
