Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A17F28EA
	for <linux-coco@lists.linux.dev>; Wed, 12 Oct 2022 16:38:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVBcqSdqdik8BifdoE8FLlDuYn8CH6+mgUtbxB+kqqdF7L+zF0xDPcZLANRsNIwrnR4QCPFW5vPtpA4FzbKogY1mYZFlitBOlracKTi65tdp7Scfv3DW1qVJQFFSVSJ3433qwlwIYC0klgE6yInwkLtQ4XSDaTScP5DLJr+e3BvDciSomBh1vXXhP77z7gDBT4wq7/uLuUzrccThAhqTzonZOdPsHYR45lJuXHjGzMqYjs8VV7ttV3hY8lmIcjFfXdHHJ/V5WN5eQRmZRbFQG6g79TozC07YpfhErnOjucz5R/uxRuXMlTo5SzM4kMUX+FEEPSDmyQVBTNgMIK/t8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyGhp3KNjBkAxFFrAJusYH/+x8OVqBQf6i/8KzPHB9o=;
 b=nZmwO9gnFNuIYV5Sjn7UvW2n3ZiGzlPC4AAMdY3Ibd60yCNM8WF8WTqw8iJXADWCDW5wtOM+9P9JCWJEkv3A9Tr+8QUwcpgI2RJoQu7kVnvsK5BOp6+VRO2LbnswS8mfjct1E/gr4po5Dx/Xs97LqWQccP3NZD4pwXInsatF22eT6VTI8iSbLvkmhYRyYDlOHCK3vpoqXUV/15JZwUKq5giBQ+nQEWx3d1wsZm7fiBROApvU7xsIGJHmEO02unfPAi2P16eicMKK1VHqHDJSH7padL5yF3arUJ+7X/Kkcp7FzfMsZoyVy6yF79Q4AUGDAXqtGYwoNEmJQoI+fha9Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyGhp3KNjBkAxFFrAJusYH/+x8OVqBQf6i/8KzPHB9o=;
 b=MshY/lewnwPbawaPqbqbxNiWgwMTHI3YmvPPfT9kmQSi8M1foDfW37/utE3KMCpQSoeB8LOP1uiGECJmr5lR3qluxWsNgtt909/3YcCiTvXemc0IVFsfMQDG3FzEb+vSHNOCBqbo8Ixf7OutXdUdBHJMyKF9t0m3axe/n9G+Fxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by SN7PR12MB6714.namprd12.prod.outlook.com (2603:10b6:806:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 16:38:53 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::ccc6:f300:dfcd:145]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::ccc6:f300:dfcd:145%4]) with mapi id 15.20.5709.018; Wed, 12 Oct 2022
 16:38:53 +0000
Message-ID: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
Date: Wed, 12 Oct 2022 11:38:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: SVSM vTPM specification
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR17CA0002.namprd17.prod.outlook.com
 (2603:10b6:208:15e::15) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|SN7PR12MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d513d6d-bfff-4e62-baa8-08daac704012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	29f4NYrHhARZWwBXqr0gOdNOzLk9zVxkCLwdm4JpFbGgatPe97IQfPEVoOAumgZGJWQyn8XCe7UJ76uJ6yJXV7cncbCT8sM8jHa1AxN5lnCzOKnPZknAoPIQlhHulH7bD7IUosD9jc0a4PRm5GyyAWISJkBPg/nIrmAhzqeR5ZF9s3xvxnDufSR32HBNuxJSjAkJ9frg9v4c/ZyzLBfn1hLmdT4gh32MoBz+ZTSp9dHVhhtZpfmsW+YX2o98Y037RkoPR7F8TutWo5iMzPVbc2phc8GL4nnzp3eDYNMtwfoy6M0wcnSXNTyYzi6VE+Sj0448sZOTAuYrjI2TZeR11W7DbYJSJhAQqQFlf3ZEhuI4coNW9L42wUMuXIbOwKOEP9ECG7RkjS+aqpRIDkhSEsbizfl6A4CWqnjzifDgrlKjc8omOX1tG7f+nkqV9AzoBiar0rOWRxXxAW15S+2ODBKVCKJ4NNv0/fXW6Cm01FjuvV3S89tiI4+waE/pY+erS83woZJl6XU0/POgF/yjV3QcQKclGaA1ysJXScaagdHkRR4gNboFTMsHFDh8IDJzD26dllmNJb5eHLYDPSL8Ndu1BHcv9tJsm7944BqAHOnXOMvA2yA+5J9zXJPguqmXsxsJQ1t/g3GrkEa6rh3zVbJDRYIssBZIvW6iU4S8bt6bSq0iJQD/EJLid7OOIYic3Terptjjof+hNHFSIV7dcxWJIlhyVDNh+38/M7m1mRgtNnWT6Ap3m11eN2CwdD1klll6ho4beUKjEUKkeSV95Fu3n5ovqqYr3tCZczZ4kJw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199015)(36756003)(8936002)(2616005)(38100700002)(110136005)(31696002)(66946007)(66556008)(86362001)(66476007)(8676002)(316002)(7116003)(2906002)(26005)(5660300002)(41300700001)(186003)(478600001)(3480700007)(83380400001)(6512007)(6486002)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDZOMEJpbFZ5dHV4WGVWY29lSDc3bmtLQlRnU0EyZ3Mzb2dmdGkvRk1uTGhG?=
 =?utf-8?B?WFM4dTBkRFlvNUtEdnpBK3hTVWhxanc4c2t4U0wvQlZrZlllRlY2Snc0RVlC?=
 =?utf-8?B?NzQ3QWpMc2UwQncyR2hkVWlIR0RjQkVINXNkUkVDOVR6RS91cTR2RG5WZVRB?=
 =?utf-8?B?cStna09PU0FUMUpzL0lUR0I1NjZvK1MxU2crdjZxOEs3RlY0dVdCZXFHSVJz?=
 =?utf-8?B?WEhCNThmZi9sZm55MENYT2QzSXNzTjlOZGlxTXpOYVNJVzZOSW43RlM5K1Iw?=
 =?utf-8?B?QW4yV0VWSWNWeEZsL3JIcUtTZ2Jxdkk0WkF3SmVLazVDYW40MWdmdTNHcjkx?=
 =?utf-8?B?ejNuU1JWaUMveXZhT2FEQ0hxVE1HdjY1bVNpMWt2SXhrVXp2QjVvSFZvSlFh?=
 =?utf-8?B?TktwVlV0VzZGL0NXTFVrREZRQ2R0QXJ6dHVTU1RLWGsxUUZJM01qZU5iRUVK?=
 =?utf-8?B?K1dVZjZOYll3SzJwMkFOU2MrNnZiNGFRZ0ZwZEdmU01ibjBvYjR1MUc0MVJU?=
 =?utf-8?B?TUJacTZYeEFQdjhna3hvTkRsRFRDWTZNbUZjS1p5MnV1UW1RRjBLMVNnVVMv?=
 =?utf-8?B?M1VNV2RlR3pzL2M1cXJITE1kM2pQRlgyV0hrS1hJRjU5aXRxeVhUdGRKdG1q?=
 =?utf-8?B?QWtBcmtUMEJsT1JTdTMzRno3NWRwdy80T3I0anprZ0RQcFFFR3J4WmhyczB3?=
 =?utf-8?B?R29KQlphbmdhSE4xK2tpNVA5am5ZeW1vcDQ2aGRDbmZHZE9pUzVkQjJ1c2FO?=
 =?utf-8?B?ZHc4Nmdoemd5QUhMc0JlN1pzdWFLRThENzdjWmt5OGJqU1RPVDl4RmhsVm9L?=
 =?utf-8?B?N0cxYWdYRC9hK2o5ZkcyVytXei82N0JNMjM2aERaYWVmTGJLbHhFT25pSXJs?=
 =?utf-8?B?Qm40VDRaZCtFMnE2UFJvTkkxdHRiUzU2S012TlNwQzRLRTVMMW03K2RKL0pv?=
 =?utf-8?B?bVQxNXc5bkxSTFM0VTZ4SkV2STJyd3hXd0svQWJXTHBSSURKU2UyVTRUem53?=
 =?utf-8?B?Nk1DSHFVKzBSc2hhNW5od2pHWUhkUW0zVzF1c0g1cTU2RTFhZFY4cVpXRHJQ?=
 =?utf-8?B?aW8rWlpYcEZ6TjFkQzdMMGIvYjhJaFhSUUlsMDBCZWo4TE5UWDFjemZ2N3lV?=
 =?utf-8?B?RXB0WFpsNTFRRHhoSkpxNWFnTDdxSC8vNVlyZTZSL2p6ZHhnV1hBNERPWktR?=
 =?utf-8?B?SVlnZ1dmK1pMQnNibC9rQ0RMRlVETld2SFREc2hiVHpkZ3JDRTBRVWdDNFlU?=
 =?utf-8?B?SERDV2lOSUpPYmE4QndiQzZBY0tTS25iWUx4ZFFOYXFvbkcraFhzNEplQjBs?=
 =?utf-8?B?TlBZY1htVG1heXp2REpteTF3R0NQcE4zWUJpM3VPY2ZxdHBoQzBVNUcyYzcv?=
 =?utf-8?B?WFB3THRVWEZtbWsrK2RaSnF4ZmJXT1ZkODJMOU51YURDTlJoeU50RUZtdVdj?=
 =?utf-8?B?RkNRQWhpckJGZzVzNXR6Y0VNYmJ1ZmkwSG9PNEVIVEdPLzBCOG1hbXA5d0FC?=
 =?utf-8?B?dEpGWEpLQlRCRUVHb1E1eWhkK2VoVW1MV0czbGRBcVR6dUNRVUp1Y2drU1hl?=
 =?utf-8?B?a0E0cTZNVThBOVdWcVhPdEFoUTMycUdHNTg1dXpSK1RGVjExV2RyMEpEVWV4?=
 =?utf-8?B?TnJaRFp3ZnRoaWJXdENYNFVacUoxR3dkN2xpdUdXOGRYQUMyTnFJT0E5djFJ?=
 =?utf-8?B?NGxxK0pza3NyKzBaK3c4ZjZGYkk3WENIRFJMYTh3SFJpODZWUm53c0M5U0dm?=
 =?utf-8?B?NUdjaXhSTmVnU1hGYzBlREcySGxrRlg0OWp2VnROQzFtT1lOUnM4OThkM3E0?=
 =?utf-8?B?TlFjbE1uTndwaFUvd2c2bzJhRHJDbTkxWTA4VXplTEp0ZTBLTENTR25SWGEx?=
 =?utf-8?B?VDRDOGoyRytlSjhXK3RZSnVYMExNbFQyRFc1RGI4cmJaS2QxQnJZZFRzaFQ5?=
 =?utf-8?B?endyajRyeW93R2Rtdjh3MnBDL3g3Zk9hc2hNeUhHVXdxQ0ZGdlJZV0dIbENv?=
 =?utf-8?B?Mk5RZmpMbWgzeHhLK2YyL3R1NHZUdE1TbXVCNStUYVd2eHFxYWZ3QTZ4VFBx?=
 =?utf-8?B?S3VXSnhFUktVUXo1Yko3MjJPWUdEMFY0WFFyMXdWNlAydVU5RW9COE9oRFda?=
 =?utf-8?Q?CKQ9wbrOpzlNtYhgASY0tF3E6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d513d6d-bfff-4e62-baa8-08daac704012
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 16:38:53.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67oKU5QirXNj29L31PBN02f5Swht9eXI6v+cEXVLV6yvbyTdublX3ctjecHQNG4gZIG+vInCHJC/KZeOtSt5tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6714

I'd like to approach this from the standpoint of an enlightened guest with 
a TPM driver that is SVSM aware. I'm by no means a TPM expert, but I'll 
pose a bunch of questions to see if we can start moving forward.

What would an enlightened guest need from the SVSM for attestation of the 
SVSM/vTPM? What would a vTPM driver need to supply to an SVSM for TPM 
operations?

For attestation, the SVSM could provide a VMPCK0 attestation report. What, 
if any, data should the guest supply to the SVSM to be part of the SNP 
attestation report data? Should this attestation request be part of the 
SVSM base protocol?

For the TPM, is it enough to emulate the TPM device register space? Rather 
than using a PCI BAR or an ACPI memory resource address, could the vTPM 
driver replicate the TPM register space in ordinary memory for the SVSM to 
process? Should this memory come from the SVSM or from the guest?

Or is there a better, more efficient method that can be used to perform 
TPM operations? What would that look like?

Here's hoping this starts the discussion...

Thanks,
Tom


