import 'dart:convert';

import 'package:casper_dart_sdk/classes/stored_value.dart';
import 'package:test/test.dart';

void main() {
  group('StoredValue', () {
    test('should parse Account stored value correctly', () {
      var mockJson = jsonDecode(
          '{"Account":{"account_hash":"account-hash-97623c065702e82ccb15387a1fb8f4f89bd6c54ea3283831249404af8fd2e4bb","named_keys":[{"name":"contract_version","key":"uref-4d95be7a26ef0ca91f2a1755a7293dfd5a25f1a0f1b69057d7d852c42614ba91-007"},{"name":"faucet","key":"hash-1c16234ad1d27b51614ec5dca0bc28ea235eb2dc3a1f9d98aa238dc3df1fd63a"},{"name":"faucet_package","key":"hash-ea058d32053f59e9f66dd3d4de4594a8a3de36c65c87417efe79cdc7c1b926b4"},{"name":"faucet_package_access","key":"uref-9eab12b986299509b4471060fe4d17f087bdd2596871c38d39019ef94f8d10a6-007"}],"main_purse":"uref-657bec09f43593b985fca6a6c1a05c90c35cd85643f96722c9ca652e5d690b94-007","associated_keys":[{"account_hash":"account-hash-97623c065702e82ccb15387a1fb8f4f89bd6c54ea3283831249404af8fd2e4bb","weight":1}],"action_thresholds":{"deployment":1,"key_management":1}}}');
      var storedValue = StoredValue.fromJson(mockJson);

      expect(storedValue.account, isNotNull);
      expect(storedValue.account?.accountHash,
          mockJson['Account']['account_hash']);
      expect(storedValue.account?.actionThresholds, isNotNull);
      expect(storedValue.account?.namedKeys[0].name, 'contract_version');
    });

    test('should parse Transfer stored value correctly', () {
      var mockJson = jsonDecode(
          '{"Transfer":{"deploy_hash":"c5bed7511b23946a87c7237fceb55fe2f3a84ee28a41f3830f021711a1210047","from":"account-hash-97623c065702e82ccb15387a1fb8f4f89bd6c54ea3283831249404af8fd2e4bb","to":"account-hash-9244197a59bf76965c4981b04e5e58824d0ba450c68cc50246e83f1b6544638a","source":"uref-657bec09f43593b985fca6a6c1a05c90c35cd85643f96722c9ca652e5d690b94-007","target":"uref-5948995a53e298255f3ffc8e13843a5d11f2f5db42c701b38cb7a287b8055aba-004","amount":"1000000000","gas":"0","id":null}}');

      var storedValue = StoredValue.fromJson(mockJson);
      expect(storedValue.transfer, isNotNull);
      expect(storedValue.transfer?.deployHash,
          mockJson['Transfer']['deploy_hash']);
    });

    test('should parse Contract stored value correctly', () {
      var mockJson = jsonDecode(
          '{"Contract":{"contract_package_hash":"package-uref","contract_wasm_hash":"wasm-hash-uref","protocol_version":"1.0.0"}}');
      var storedValue = StoredValue.fromJson(mockJson);
      expect(storedValue.contract, isNotNull);
      expect(storedValue.contract?.contractPackageHash,
          mockJson['Contract']['contract_package_hash']);
      expect(storedValue.contract?.contractWasmHash,
          mockJson['Contract']['contract_wasm_hash']);
      expect(storedValue.contract?.protocolVersion,
          mockJson['Contract']['protocol_version']);
    });

    test('should parse DeployInfo stored value correctly', () {
      var mockJson = jsonDecode(
          '{"DeployInfo":{"deploy_hash":"c5bed7511b23946a87c7237fceb55fe2f3a84ee28a41f3830f021711a1210047","transfers":["transfer-c6c3694f3760c562ca41bcfb394f10783e529d336f17a11900b57234830b3e13"],"from":"account-hash-97623c065702e82ccb15387a1fb8f4f89bd6c54ea3283831249404af8fd2e4bb","source":"uref-657bec09f43593b985fca6a6c1a05c90c35cd85643f96722c9ca652e5d690b94-007","gas":"0"}}');
      var storedValue = StoredValue.fromJson(mockJson);
      expect(storedValue.deployInfo, isNotNull);
      expect(storedValue.deployInfo?.deployHash,
          mockJson['DeployInfo']['deploy_hash']);
      expect(storedValue.deployInfo?.from, mockJson['DeployInfo']['from']);
    });
  });
}
