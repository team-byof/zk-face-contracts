// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../contracts/FaceKeyRecover.sol";
import "forge-std/console.sol";

// https://book.getfoundry.sh/tutorials/solidity-scripting
// forge script script/Deploy.s.sol:Deploy --rpc-url $MOONBASE_RPC_URL --broadcast --verify -vvvv
// {
//   "commitment": "0x43bd1b418a98581fd8e6bb27e7a6a1a78713f548c18108265d1ce2b327862ffda83598b12e4ff6f90c2d90a193f0775494ea31d4855a3d414dd90c74701ace0952157aada5265d5d97ae1e8cd9a3670ab32d7c08cd722fb26faa85d453a938b3cc3789930c85eb5880a04c04a4a88a5b497925f1b9485adf95f7a7eaf8ca773a85c2298c28d32f6d00000000",
//   "commitment_hash": "0x15098279eb45701737a525059e145ed94f3c69ae7c57aa23b15ef56c278bc347",
//   "message": "0x9a8f43",
//   "feature_hash": "0x0fd1096e4e5bacf7894236705a02925c09454b86b8ab0c4db70421bb985b8113",
//   "message_hash": "0x2331721deaf139d9f70dc1d07f0400e33e5d996ec76607ebf8616b6131049408"
// }

// {
//   "features": "0xddeb377dc4515c05a074b583e42403675d9b785d7502a064ebf1d093474b23ce000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
//   "errors": "0x0000000000000000080000000000000000000010000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
//   "commitment": "0x43bd1b418a98581fd8e6bb27e7a6a1a78713f548c18108265d1ce2b327862ffda83598b12e4ff6f90c2d90a193f0775494ea31d4855a3d414dd90c74701ace0952157aada5265d5d97ae1e8cd9a3670ab32d7c08cd722fb26faa85d453a938b3cc3789930c85eb5880a04c04a4a88a5b497925f1b9485adf95f7a7eaf8ca773a85c2298c28d32f6d00000000",
//   "message": "0x9a8f43"
// }

// forge script script/RunDeployed.s.sol:RunDeployed --rpc-url $MOONBASE_RPC_URL --broadcast --verify -vvvv
contract RunDeployed is Script {
    address constant DeployedFaceKeyRecover = 0x3e3a5e3a57528a9c037b19D168189aD030e374a4;

    // params for registeration
    bytes32 constant featureHash = 0x0fd1096e4e5bacf7894236705a02925c09454b86b8ab0c4db70421bb985b8113;
    bytes32 constant commitmentHash = 0x15098279eb45701737a525059e145ed94f3c69ae7c57aa23b15ef56c278bc347;
    bytes constant commitment = hex"43bd1b418a98581fd8e6bb27e7a6a1a78713f548c18108265d1ce2b327862ffda83598b12e4ff6f90c2d90a193f0775494ea31d4855a3d414dd90c74701ace0952157aada5265d5d97ae1e8cd9a3670ab32d7c08cd722fb26faa85d453a938b3cc3789930c85eb5880a04c04a4a88a5b497925f1b9485adf95f7a7eaf8ca773a85c2298c28d32f6d00000000";

    // params for recover
    bytes32 constant messageHash = 0x2331721deaf139d9f70dc1d07f0400e33e5d996ec76607ebf8616b6131049408;
    bytes constant proof = hex"1d993161c0ca04454e002ab3fa31472cc7514aeefcc22e4e490c0d16cf7e53ac0e5348b2fa4c27ec14f5a520fa2d92174239388faf1486bd5fd7b598be745ef52e0433dcb163bf92f3fde87b0c972763644228aa9dd9c328ead2ecdd5efa558206045b1fa6f507f08cdb9713973e8b9cbf488f377904108762b597c2d85cb0760a4154cb7f6ab0cc8b2150f0f0ce1e22876fab281cf33422cbc0ca53354fcd4a1520e2df60fe1e3fe3cd04ca3ebf04e0523ac424de0f45e07e1f95a869df2a5d08709e5a3f017aa9bd8dbe83dacbd66649ca71618c9e843c65eeb67b3c5c5e4213448e48039bd9ce0944ba0e6e7ce441e99cbd3970f881c5e29a6c0fae07e11d243c5251e8f8eb331d195bf1b1ad1e09ff6ac986fa48f3f7e89f4d26d8af094121153be40bd68680e0369eb199782b3c505a1b4470a849ec0a7cc5d26bfa886110f4151da52edaeb427cb6b1b39c0368e55cb994ee790a5c41adf2298894fc3a104f5d67295f17f2963b52c90f11cff46d7304020e8a9d74c90a30dc64b105e00301564cfec1ad6210e271e33b7562b7ba3f4d0b60e02828f6dff76c8728caac2679834166f0591a29dbef2f91c3a435a8513165312edb2ab7ab4c6042171c711ec438e988bc459a63078bb3529548a6eeab141db1fdc9ce491e8979da388cd40bab95098a7c4794aec236fe4c9d0134c06cf8f85134b0867a9086cbb7eb1d590019da02e8740b18ea137dc97b6531e754618e994a1d7a65d870ee3e62add19f00e73016969b9d5816af7eedef975ed69a113cdf4723b2c7e0d50a0c6f5a8ec5267be0c94191ef322261f62e4818d745d35d45f20c4469426a4024724fdaa8be1e5fca416e13f4022b9b5820df64941e2e9bc7b9888d6625ed3857ebf79996bb1799f5342e7040bb84abb2fc301ddea90a54aca38afb626ca1c2045d47d421f000557c1cccfba3842735623b8619aa8057c1aa51929e7e9c2ecf303f33f4bac6001492073da0f4681efd4e5dc928b1f0e8c1a310cb69648084c2fe70001f03e61cdd1fb1a4934b15f9d12c7643cb411230ddbe6bf629a5538d582ff85ee7cf792653bf858155b807a2737420b6ac9916b93a81269e3c28c3a8371d5cc6f8db0a03a787d78ed0317f3f489a515992c4f16384220250867ae209bc158cb5dd9e3605aa422ed39a9e656998ce9d051d6934f4c9e708c58f296fe4ae7e579e5ea3502c0c55436cdce62afda3ee5051a93650d34e5e3326f767cb912bb730dc752c6e17366550798a66a998f980dcd4ec97b1dcca201461d1bece923210733aeac8c71f00f0a3f092f88cb2bf7627e328b38a3fa93e990b01452ed1bc7dd2d51d461504d6d8af068eac5b58de01b418d684f0e3408f0382c6631a85db32d934c3c71e253bd7be3aa5025ee56886ced9cf2c17da454187ae99e7def0133e21c2a960bf2cd47ac5801459e8c73e5f3ab5f51458e7c1700800694fa58f53d0a1f816d30c0ddcbebcf2b3fb8b012b3ca51d761041efa0a9cde4fa7e6b27d1e20aa4b8d4941bc81c0ae3b3b92af5575f075496e1760637f14272ccf6da12d928d701eed10613ff4420e3b2f3a14816097613598ba69789cbacb264e3cf9d2aad6c7ea6d02c1e29fec5030c5702cc3c9b4d3ffe18c1f5b1dea3786fa05fdce1b2a62745f96913ca1cdf955ce7f623e90318bea6e662665c90200b869921c7b147e8b05255512deac30cf634d8785866e253e396687ad7c8a87623027552d6255dd46c95401226fba4ce007ba1951ef94c57ce7c2efbd9d3a48549563acb2f8f2a3e6f2f874301da29aa2e8ee5bc0ea0d25783d19c765b803da653be6ed8d028aa6a04f7c7560e9e2886152ff1a1da1438f730da0e1d7b6edb3af01d0ae57910fdf9920e7eaf192d56b6b85cbbed853a770becda31bee327b66b382078e542ed5c643a99f7ee06bb03f56917e88d27c66ca24fe3feed3df9eebeb269537f60bd511afa2b4368236fc1c2994061423b82f7ec40c4aa338adbc0445421490451d85962866023d80ec7f8eb043f84b16b167c28842e31b824df0e290aff368a417cd150acb4c663087bea7d07db820ff6065d5bf682a70dfd05325c1d157460e2dc838ebe371eb113c4b93bdeee3abb0d72518ad6098ef63fc5e9973f909fa93664313245f9a81318dd25c1f6b4f7d8d4150f2d424cfd416e54b12b412b265f880b6f14368450ed";

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address myAddress = 0xcCC05d9631e7B0F1E5629A62E79A9F1C84ad5dC5;
        vm.startBroadcast(deployerPrivateKey);

        FaceKeyRecover deployed = FaceKeyRecover(DeployedFaceKeyRecover);
        // deployed.register(
        //   myAddress,
        //   featureHash,
        //   commitmentHash,
        //   commitment
        // );

        console.log(deployed.isRegistered(myAddress));

        deployed.recover(
          myAddress,
          messageHash,
          proof
        );
        console.log(deployed.isRegistered(myAddress));
        console.log(deployed.isRegistered(msg.sender));

        // deployed.register
        vm.stopBroadcast();
    }
}

