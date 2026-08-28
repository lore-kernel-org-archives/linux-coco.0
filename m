Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46FA4562A9
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945699; cv=fail; b=RN91JIK5uzpIXBupk2wIcJokZxDEs7aEUWpspv/w5t/7w0rpGizjuylgH67pcWUFbeVkStvWp/X2RMHP/KldsnxdRTjY3EQ5uoWJ6aLvUSuFh3ys20g/GCflkd+8JFXvdRG0q9LvqAkyWD2fznnWdbphQgduGEhKNftuABu17uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945699; c=relaxed/simple;
	bh=I4DukqsD6VQnq11HH5r5dskuifE/sxPZ5d3tsbXA9Yo=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=W+phuSxqLPU0bbROexoo6e1zUWOyBZ2NKNZx5p/i6rieaBuTF6VvravSLidNBnjH92yUqD3b7SHP+rc79A32d7EHyUTJvEVU3k8CUjymkDXOi7uEKqEJooShUfoRNjjgWUoQqmXbgJqtxdA6JiYYoBjFPPFNlbrpiO5WXmAGqM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ckVUDeEa; arc=fail smtp.client-ip=52.101.61.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ckVUDeEa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXb/d/dtlfz+EqBOGqWWN4bKueBK0pAYXJF54+i5os52kDBhCRZmSdBuUdgcKZQFDoSBpukCoTTKQzCyHHXtvekdyYv0usOHJuVzry1uykywOhbMUh6Fj2JrWa12y0TBtD06XlPY66UBx4HG4SdEVTxAr4vGiqSfv56U0UdetAHetaq0hCV+SaR4x6XU7V+uRsAkoOdeuaUGZc5vaEozrA+RfURkZJ1adFt4Z9IaVzUwjCGJL1XH7PNdLWH4mA6FtSMYF6SBNaFbxRR9++54q5Z3+PluO99eGx2kh8QGjFIW9xsDmdYXsBQqE5C3JVIMdVdJADJ4Ob7BphQZEwqa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqMnR5Kl93dlA61flnz0bG7hJHMK6CSxTqlPS/Oh0wY=;
 b=OgTYQ2ymEzdxVnqEESrJy+w8xvIOD9RMMLND3/wicDA25cKwsp6i+AbeGXnxegT1mlMWV+y+hvsQlGF70TM09d61RP3cIJOv0MOuu3P9PEDVzW/wbuGyT3Ppgli1ELnKlu69liRUJry8gXZ+eZXfOQDm6p7W5dx6HDrozOK8FwCbmLDHfPA52T33TMU4NQpnmq54JM/90EnH8/qzX6+z1r/Fgq6t9xv/4JUeSXQpcKJJ/FTKE1Xd9w9S+8m0tlGGTm9DsUPR+ow1vkhx961tCajFaPk81bTp+Lah9eljG0zfgu86bhUa7hdDYmPyG2mFMuGObdRewOykXMSOBZ4tUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqMnR5Kl93dlA61flnz0bG7hJHMK6CSxTqlPS/Oh0wY=;
 b=ckVUDeEahrycd9xpDSO67YNcsf5yeGXyQjTak+Gz3qnkeeyUAf2CBlhyP29P5efF8Wqf+WAYYOkt1NEx5Psq3bzprLKeVkfwqK8ewiHKhHbyZOuCOkOgvXbGZJ80A2ZHicWEoSB6fvjhZnos8VrYBxMhUtGvKJbb+JftGLfTZ68xgN0d99R6LLgwMWif3aEsAk9j5UQllKPVciSIdewqUUloCTA6IoUUFiSonGLu6Jda8BNbdiQtARUtgfOKxBOVqxLE73DKmiPKWTIauJk6v7EaEEh/NJj3yhxvPG7xStf17pvCKvFXVUg9DF+c7s5Ui0oSSXwv0duYhWvl+/3nrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9608.namprd12.prod.outlook.com (2603:10b6:930:102::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 19:34:47 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:34:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>, 
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260805063255.1638614-7-aneesh.kumar@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-7-aneesh.kumar@kernel.org>
Date: Fri, 28 Aug 2026 16:34:37 -0300
Message-Id: <178794567780.4159892.17969556982711821646.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BLAPR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:208:32f::34) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9608:EE_
X-MS-Office365-Filtering-Correlation-Id: d8911b40-9a86-4bab-fc0a-08df053b682a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10067099003|6133799003|18002099003|22082099003|4143699003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	9s/5Xlu7eUM/fh3Ee5jDsuqZld5kA75gSRTH+hC2RCIxsGGV9g2yOmrkLdlvMvvpnaOaxJ2Arg5tPPiJHryZoR3LtGN+oF9sTEVh+vNKEW2b1VLvx/mXE/uhvx2aR2zHwAez3Hyz+mFZgZ3tlxtswl+Z+Yw5v3JwAZQcVzyIqqh+Y/aFNE+pR0rgEvYRXxCOvM1DspVwg7cRsF4ZxAsGG11mUeIHe5fI2s35+Bn7NLqpYyRceNc3ClCEUIOAJe/xkBR7LSnSGio8QAHKngcc8x+5346AtQ72VHSHbeQW+wMJxCrqjdJ9B5S7IkYJdhr+zO6wJPxxmtghqMHaG4RfhcwDuB91ceFfXoq/ntJDtxGcjL4TaO2taSOAvwO9uoM4IZEIIQIWkizWLMqvim1kncdQfgVP42LhAMWSI26/Jl0S7M9KkfjLI4nCfckD2fXb/uGOiq6suyR2/lmYbvwNhWRWLpYZ3XHIwuOd7dVqGojv2LHybB93aVIXdpxvFZRH5d29R4RkN/ecOgTLtr/sJtmZhOcsKnMbRxSv4j8eQJDxR4c4E5GmRGiU8MYXXyUF+CXfdpVwRNgCYlhdoZVhpfE1OKsu4PL089WBdR+n7FUk9ewahswemb8zRLAmn3axa1Zv/eLm4Es2CeW26CBJZGhJEvJeF6iP189rPrvVlmk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE1vc1kzZWhGdmdoRTN1T2hLdld3SGVuRmNjaXNWV0oweDJ0WnNOb1NVdlJH?=
 =?utf-8?B?RHNaQmdZMkorQSswWG1DSmd5WkQ5dmV0VlV2eFcxRUJIcDRVa3Z4UWovNXFl?=
 =?utf-8?B?cmtpZjJhRytPVmZIU0J2cm9pcWlZeituc1JRd3ZhQ2g1ZnRlcXpmeTRxd0Z6?=
 =?utf-8?B?UVpwalF0OWQvbm90azhiRUJOY1NIUERzaXVnQkNaUjJuVVgrd0ZIRHpuVDhM?=
 =?utf-8?B?WStSbU5PeFRaLysxdFpnZy8vNVltajE1ZENEWVNEUkVXRGlDV3pSMUkxTHlS?=
 =?utf-8?B?SVdjZkJ4amVJRGticDd6bFR2Sk9sUGx4UjFNZHNmQnlqTDk4cjN1TE91RFBY?=
 =?utf-8?B?RGFYa2dYeWxLTFF1ZEI5RkxXWU9DZTNXVDJ5N3l6NGlrMnBKZjRwY3luT0pa?=
 =?utf-8?B?UmpuY0duNThEdGxlSitVb0pvbWlLalRPcHB3V0xzeTFoMGhMTllCdVJGREVY?=
 =?utf-8?B?c2JpS3NSL0poTzF1VHpxMHlxRUk1V21qOVNPNnArMkl3NGJTei9RMHJqL28x?=
 =?utf-8?B?aC9kakFQUlNYdytFNmZpa0JWVUpxMlFNZEdKUldGZnZ4L2dUWk90MUJUOVBG?=
 =?utf-8?B?M1V5RWpxYzl0SXhGYWoybkZhdDZNS1RTR0NlWDJBMWM5VEFuOEkyQkxZd0Zo?=
 =?utf-8?B?cWF1NHpvaGIwOXNGTC9yOEpDS05vdUU1OWJwVDFKWW10L2RINzgyeG1VaWtI?=
 =?utf-8?B?N093NHVVVzJleXE4RkxpM29GZ0FXaUFZUG1mSlVYcHppNzVIdEJlVGduVzgw?=
 =?utf-8?B?NGx4cXBraFZiU3hTOXRac3JkQ2ZwbWVUWFRuRFg1dldoc0ptK0hmdllVQmlD?=
 =?utf-8?B?UUJwZHJGUGkxdGRJZWl5bmY4T1lSdktBWXhUYjRZTE5HSGFHdXVoZEFTNTJT?=
 =?utf-8?B?aGkwZ0xTaldOTFBlMkdieXNEc2RTTjRtRjR2MkdnOG10Nll5WDl3ZTJyNG1P?=
 =?utf-8?B?L3JUWnBRNUx0OHNnOXVrSWcraXd0eHcvRUp3ZFhNRWZscVcwVW5PcHhrOHZj?=
 =?utf-8?B?UnJSYzFnS2MxK2xlWm5lU1V4RHhYd05CbWp1SEpNOG5nZXRhQ0ErajkrRnRK?=
 =?utf-8?B?TnZYRHZPeS9BV1FjbDlJdDU2UVZFRndoaHl6TnQ1RVdyVkVxa3ZKZ0lYT1lX?=
 =?utf-8?B?Z25LSUJ5d0JvaWNxQjRKVDMycGRHQzk5QUdMS1NqTGFzVStoWGd4TmMreTYy?=
 =?utf-8?B?M0huNnU5ankyUENZNHBpQmtvU2JSYnlIaVQvZ0pVRGswYVhUNUZLTnNPRlVj?=
 =?utf-8?B?MjVjd29WWU5UQ1Njb2RyWmh5WDk2V1cwWmhqdDZhWW5jMlA5WTFGVWx2d29Z?=
 =?utf-8?B?SWJMT0xmMG1CU1ZCVlhuc3RDUktTN2RTK0RIeldUTS80MHRzR1BVVTBSOFdm?=
 =?utf-8?B?SVh5WlBRbFc4aXRVT3MzdjAyS2o1bHJVdk5WTWJpVDBabU53WmxuTkFrT1J3?=
 =?utf-8?B?VDBxQmRCQ2Fiam5NcjE0ejZSeHlGZVhGQ1pLMXo3MTB3M3hJZ1ZHb3BhTGVn?=
 =?utf-8?B?NFN4Qjl4blhPZHBDc0xXZ2dSWk5tcGhwVXhGS0tkNHAyUDk0SnZPOEF5cGNz?=
 =?utf-8?B?N2tHWUNWMW1aMU1OTENDckVuYVF0Tk52K2IxZ2swU0EvYVRYdzVCRmxiZi9G?=
 =?utf-8?B?L1hnOWxZWjJvRWF1VklDSFNmamR4MGQ3THFwMVpNQjNseW53NVg0SWowWTRO?=
 =?utf-8?B?Z0hXcFkwNm43LzI1M0I2YjRjSTg5eTExcUVtM09JaUhTbnF6UkFLdDIwY0Nn?=
 =?utf-8?B?NlkwckJKQVQwMU9QcTloZ2QrS0V0K3VySGltK2xHaFl0TTlUVldRclc5Y0hj?=
 =?utf-8?B?Wjc2aFdLNU5WN3cvZjhFWVV3QXhpbHpQc0xCRVN3L1dwQW05aHBycTNWL3Nm?=
 =?utf-8?B?S1JqL0FVTDVUZ0trWFhxc2ZuT3FpWjJqVlRXd3BtbEJKVXJNU2d1Wms1bS84?=
 =?utf-8?B?bktTM2RFTnpYVmVhNDFXV1ViMEpzMklPU0RIMEZHR2MzaFhabStlUWN5MTdk?=
 =?utf-8?B?MDJmZGFxWklFVmw5NGwvdVVrUnQ4TE9nU2QrWjVSL2dsRmhKYTR1NHhqc3ZQ?=
 =?utf-8?B?VHRpaFFlV1JyNXc3Vk5mNDZGejNoM0Vwc3lWV3Z0alVBRC9OSEYvakNLN1ov?=
 =?utf-8?B?ODNkZ3dRVFVPNC9vbVZEZzlGb3RWMGI4aXl3Nm9sYXcrZUR2cFMrK3N4NFFO?=
 =?utf-8?B?bGJ6VXFpR1ladkIxRmorckJPbXB5VTFyOHY4c0IxOW41QjVQaTFQMW44VkVE?=
 =?utf-8?B?dDgzN1ZwZHFzMHpmTFZKdW1keC9BYjlKMEViVElWUU1LSkoxUGRYSDZoV0Jl?=
 =?utf-8?Q?TJLzVQs5ktftGaviqX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8911b40-9a86-4bab-fc0a-08df053b682a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:34:42.2619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEgon7I/q+/nRc50SGpA0V3IKuz+Ws2q7kWEQ/Ocszl7BvXYpOgdT55S9Xpkbqt5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9608

> [ ... 43 lines skipped ... ]
> @@ -94,6 +95,12 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>  		.requires_smc   = false,
>  		.device_name    = "arm-smccc-trng",
>  	},
> +
> +	{
> +		.func_id        = SMC_RSI_ABI_VERSION,
 [Severity: High]
 Does this new entry cause uninitialized registers to be passed to the
 firmware?

 Looking at smccc_probe_smccc_device():

 	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);

 The invocation only passes the func_id, leaving r1 uninitialized. Since the
 SMC_RSI_ABI_VERSION ABI requires r1 to hold the requested version parameter,
 does this leak uninitialized kernel register state to the firmware and pass
 a garbage ABI version?

This seems like a good point.. Several other APIs had this 'pass a
thing in' as part of their version contract too.

There is ABI incompatabilitiy here right? It would make sense to break
up the really different versions into different device strings if
possible. eg v1 and v2?

...

 [Severity: High]
 Could this also execute an SMC64 call on 32-bit ARM (AArch32) systems?

 The smccc_devices array unconditionally includes SMC_RSI_ABI_VERSION, which
 is an SMC64 call. Executing an SMC64 function identifier from an AArch32
 execution state is architecturally unpredictable and could cause a crash
 or hang on 32-bit hardware.

No idea if sashiko is right , but it is what I was wondering about in
the rng patch...

> [ ... 44 lines skipped ... ]
> +static void unregister_cca_tsm_report(void *data)
> +{
> +	tsm_report_unregister(&arm_cca_tsm_report_ops);
> +}
> +
> +static int cca_tsm_probe(struct arm_smccc_device *sdev)
>  {
>  	int ret;
>  
> @@ -178,30 +175,33 @@ static int __init arm_cca_guest_init(void)
>  		return -ENODEV;
>  
>  	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
> -	if (ret < 0)
> -		pr_err("Error %d registering with TSM\n", ret);
> +	if (ret < 0) {
> +		dev_err_probe(&sdev->dev, ret, "Error registering with TSM\n");
> +		return ret;
> +	}
>  
> -	return ret;
> +	ret = devm_add_action_or_reset(&sdev->dev, unregister_cca_tsm_report,
> +				       NULL);
> +	if (ret < 0) {

Can just make unregister the remove function. Don't need to use devm
for everything.

-- 
Jason
