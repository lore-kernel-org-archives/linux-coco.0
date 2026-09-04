Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C8A523791
	for <linux-coco@lists.linux.dev>; Fri,  4 Sep 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550835; cv=fail; b=mKSotTNnWqDLoz4MQHoxiwEZ8CzmzNZICnkdPi1e7BBykHNtanr2Pb5E3zTJf05Dq6ZgBAfJDbmk9Lrd3LM7Ho4/idY2cQ4Z/3pmYL966eeWiDwYizcWQdIu5a710BBfzoq5KCU7qwLtFm7wZIIzXGT02R8I2CevFSjDK2dNeDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550835; c=relaxed/simple;
	bh=N14ahlKj01OPBX+1g7st4xCmIiHzH9T/+vcdqrtwEZo=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=lVw1nvhCP6nUSWQE/yzR+Pu586lPhRvJ03IOnUtD0cs8llDplv8rnrx7BFervCk0FjwIQa/hJm0lRpI83G5JYl3UXU1SqgP8rZ4H92+g8+BEFgLkovCXcyxvl2Did8rCMQ5Mcht6vb9eOc+4/sVk2+tCxOhwecuuOQo94nh0JuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HrHHRhod; arc=fail smtp.client-ip=52.101.61.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HrHHRhod"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paCZU5EQ0+S2XQ9FrGaNWou2NICMXHd8BgQSWdZ/rt/S+YU2ovUKNtiJby0MT1s7CSjA+lc9ZW8R6ts1U8WgzJyZxqvd4sET5lDemwbC1I2VIAwj0/1508gILP+J6KSoZZeSRv6sQL8UOCpKvWJqTbsbp1UFeWmV4S/ILnUUorov/UXKrnQx9JviySXSfNdfr5kCOGl6PO8atqerqZeBjiXlo6rJLf8s7Xa1VhpPwfAhwrIxuZf6Yk4GwrAM5ZvEFDf+65nQeUmtxiCJPkOO87WrE8pYBE5TnLp9JW5o/mcLwgpxHqzrb7VDRYk11XYCehGiZT7fT8EH1JUC7qcucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jq+N4vLF/G7AxjCjoqdYp5jWLK188h74X4O0OL7DkKc=;
 b=yCwMxQdGF/C4ra5/zqpDHz64/Gczrf+LEpHw6CCUX3rw6YhdP6wcb5pmANUnVQn5Fz8l5bevVe4gJI6m2hYU+sL4nJU0aoXTodHRsHID2St+vpotJWKOju9UAcW4i2XlmWZlWJ4L7XHqQG/iMjf56WlK8TLg7cpf0lZrc/mZBDjqqv5Zn57GEbm4T/AGh9vxat7L+ejIj5Z+FfTYYkVUG2Jh4jL2jUr+BrqSX3alJrnVMZEvQ7Ps5VRd/KATBkb0N4Al0XcER8I+PXqfqa2ZQs7K0V/7rGuXGCuebqDPfQ0nTxn+dKhzU+OU3F/AJ6TpO3ehySbStUsqAOCWZ6tGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq+N4vLF/G7AxjCjoqdYp5jWLK188h74X4O0OL7DkKc=;
 b=HrHHRhodvD8h+GbfqEedNFsY67eAZ4nrBWwTUFCwcanTS3KUUnL+F9ZPTFYuNiAn6zLzJQSydMNyECXWLNlRAntWXlTZf99KZO3DYeBCW+Z/+TJCOYqFGSPN8Ocv7qyEjlOIdqXZHW2hDGTIKPBJyPJ3fy+Uo0aENdEL3WkQPr73Fj05PTV4LfGVfO6t/ZMBspj2iAzDT1FsaSUILMVxlQ0QOkIpVO7Q3/CwuAuKa5+aWPr+AVeDLy+IveiW4GrN4R/Ig0WZ7BnHeOP11HkTy9fagV+cObjtMoudM7Gmg7LjyXIIzYyQUNIiVsSV6mdr01XLVC+oEDyz0Mo0qcGstQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 19:39:43 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 19:39:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
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
In-Reply-To: <20260904095000.1184861-8-aneesh.kumar@kernel.org>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-8-aneesh.kumar@kernel.org>
Date: Fri, 04 Sep 2026 16:39:35 -0300
Message-Id: <178855077573.693280.8986222782617548173.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: MN0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:52f::34) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ae90c5-4eeb-4fc6-3e12-08df0abc430e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3il83oEqxfAKEWYgMkPZgFvupBIi2Ji4YNQjFrusLNpEHElazvjWvK7UTQdscVCZLQJ443eInK5rd8fTRbYpsNXE3MdoYk/YlcPFXivG4OuMWLRDucJq5SWOzBjj7eDHJqtCp0uNZC9bxt4AMTJZEHnJ0PFA0yG3Iudl6OSpv/AKrWIE3gQ3GM4Hm7mmZs1aSCKl/fasueGk9GW3LP3lczrPvDQNQRzpFc7WciuUDeD7IQNsUkkqnWFPy2O5l8t0J2m54zEK/LE7C4yJ3NbyTUGpQGlJx+Myi5BlMHtZMCmneuowCb9rruxKFCrFqdiX8uiREcYkt+Vldklv1QH16iJAjpOLNjDRve3LMeEkg5XyrolhDW8EHEnCsVGjg0ewmT0sL6P5Qjz2+vH4l8z4tRSPtDkIR/EAvb5KX+c0d+N8mXtIXComEQkFxTJEP3WMoudx4mesFP5EqG8NcdLWNXJxMSPSI7De7EoekVfg38rOR6jZiDq+HOpyh5i65FcZsSilGXgGTw9JnsefyLqLxGSzmwse31n00lHmQ2kCAri6sCaj/V3vum3+V4Qt09j3+XFixTcwrIeqITX28v4WQWheWHTqYypwVBAaCtc2NPBUHhRPecNfhJ2p4RTAy2by1kqFwMSZWCziSeT5VE06lKhv2TQAuxZ1R4OoFBLLPV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnFRUVZaYjZ3cjBlaGNCTWZNemxVVzhQaXlVK2hRY2hBTkxsdXBMd1RMUEVw?=
 =?utf-8?B?dFJzQU5HQVQvekc2Q1AvK21vaGF2OWloQkJDbG41c1pOU1FjZXRsT1VSbUxn?=
 =?utf-8?B?aXZkMGpOaUVXdGhMWjdEMjlFUEQyRklVL1djMUNBTUxPM1pjWFlnSzNpUGR6?=
 =?utf-8?B?NDRPUHAwdExXS2Q2N1ZBaVNzSytINlE3SS9WeTk1N3JmcVdwSnFzaFYvdDcr?=
 =?utf-8?B?Z3VLWHd5Q2ZOMDdmOEpub2UrY3ZnVUJEdlkxeE9PQk14SE9EVGR3WGpLbjlK?=
 =?utf-8?B?YWYycUdRZzNsY1hOSTBGb2p5bmZkeTN5YTgwSU9QdTUvaXRjZnRMVnErWmh4?=
 =?utf-8?B?MEZlZFh6RzNpNW03YUlmK0JNWUJ5N2JDekJ0SGFwOWJLdUlyZmZVVzJndVph?=
 =?utf-8?B?RjAxNkpDRzNuc3BBR0p0ZWJWZUJRWk1qeHRPaERBVUtQUllCdFhNdjBDdDR5?=
 =?utf-8?B?dnVsV1o4NGEyQVdSUStWaXVIRkVndVFLUU9JdUV2S0FyMGVKZlk0YkdNdzRN?=
 =?utf-8?B?L21nS1F1TjZ3bWhQdFRkOGVNNGhOT1hTR3NLQSs2VGtnLzJ5OHduNWliWTF0?=
 =?utf-8?B?UVF5YUtad01lWUErUlRpTlpFTk9XSUdyT0g0Mm5uVmljdWtDTm9IbmhjUndH?=
 =?utf-8?B?SHBpOElGVkFXT1QvT0h6MVpWWUo1emxvT1lkdW41aHF3SWpveVUrU1FOcDFG?=
 =?utf-8?B?eEN4ZmpIaVE4aTJSSFlxVFQzdHI1TzJLalFPckF1V1pUeGcyOHlZS3cvS0xX?=
 =?utf-8?B?N2U4aDFYV1gwczFlN2RJd1pxMFl2L29XVjIwczRIWEIxUDVrOEhsMzVDU0RT?=
 =?utf-8?B?NENsZWlnejVISkJWdmwrTmkyNkM2M3NSZnpnbDgwVWg2enIrb0xuV29zcFYx?=
 =?utf-8?B?OHdUdXlMaWQrUHhqK0F6cHJyR3Bmd280R1FJUzd3Zkh3ekYySzJBdWo5TjlQ?=
 =?utf-8?B?UWdCVmNHSm5YWGhrUW5NekpsMm1uMDJNRFI1ZDZUTnduNTJjcmdJbTBmSnFS?=
 =?utf-8?B?Y0p4dlA2QWdrSWI3anlUZDlPdEtPV3RPSFVHVnB2eFZBYm93OTJHRUp1VTBN?=
 =?utf-8?B?aFVEaTRGbUF1NTJFbkkxS1JBOHJyTmRMWkVvd2M0MFVyVGlPSXpXWjBpbGY2?=
 =?utf-8?B?MjcxaTgxY1dyWStQdGxEYkJ3dXphc0tWTzFrdjZGdWVpWWdTMHloaFl3S0Jz?=
 =?utf-8?B?TVFTZXJ6T21LS2dVcU9UME5POVNsZDM5WXk2REo2L0hsUWFHSC9ISUQzM2wr?=
 =?utf-8?B?b002M2dXek5lVEgwTlh2TjZVQTUzbTROV0VwUUNTSGNSL1IwOWFrVjYvcmtJ?=
 =?utf-8?B?Vk9tVkJjQ29kVW9pSE5zdmpNZzBtWUVnV1Nnc2ZRNlhzS0xiYVJiSnh3MGVY?=
 =?utf-8?B?Y0xwZjFQQ2RkK3lWckU3d3NYeW1pd0o0dFhiSG8xbCtNSmpnZEM3OU1EdDBS?=
 =?utf-8?B?VVMwSGdGMUwvK1pUYndhd0hOWjEwUW1ZOThTRnVEY0tQMU1rbDREUW05U0F3?=
 =?utf-8?B?TS93UFZHVEN1UHpZTzV2ZzRqcWNCeXJrNzNseGpwTEtObC8vdlh3OWZYQ0Z1?=
 =?utf-8?B?WXl1RlduVTZqTlFpSXl0RytSaUlLNGtDSzJ4ZjlCWkNPZ3JQSjh1TUwwQTRG?=
 =?utf-8?B?SVRSQ1cydU81RjBlT3NmM3d2b29Sc1J0MkJ0ekFvL2ZoVGJTcThsMEM3cXEy?=
 =?utf-8?B?WnBKQnRBQk5YTk84a29tSkdGNEowQUJxeUJmUHhhZkVCL2k5aXkwLzFybWFU?=
 =?utf-8?B?NzVrNkpzRmVOK1JhV2U1OGpwMzIyR1JxcThLZko2WVNXZVpQNmJ1UmtuaWpB?=
 =?utf-8?B?a0FGV0U0TUpBVy9jcjBCMHU5YzROQUZ0YmtNZnMrbzl1ekhlb0RiSmlqUW40?=
 =?utf-8?B?VXFKZElkNnNhZVdUWkF3L25hYW8wRyt6Nml3V2lQRXF4Y3NXQU94NkZQcFh3?=
 =?utf-8?B?aFlxVEJncU5YbjNzaDV6S3hjYnJsWllZQVhReFNvbmpwNWRqcm4yZEFab0Nj?=
 =?utf-8?B?cU5pbEYrWVdVQnp1Zkc2c0QwYTJJeHd5d0Y3K0lsTXNzZWlJaUhaL2JGMDFi?=
 =?utf-8?B?V2wycWozZGxPRkVrYk5rbmFueHJTWW52OWY5N2hzRWs5OG5MZGZWV3diUFU5?=
 =?utf-8?B?elVvNGllUFc2cEs1dW12bzd5ZysyWkp2OVdieFJ1Z2dKTlArVFFyVzZJQ0VR?=
 =?utf-8?B?cDk2OGxGY0dtVk9MajZtUm1sVmZSeFVmSEZhNHpUeWFoVFpGUVpJemJJWW10?=
 =?utf-8?B?U05wZTUycUhFYUtYNlI3VTFTdmcwam1VYlRUN1piWnNsZ3phODV6NVpuUFVR?=
 =?utf-8?Q?83g/4NXS4mtYVvGJnM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ae90c5-4eeb-4fc6-3e12-08df0abc430e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:39:40.7837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wA4T5hVcZWWUOabt5uDwCaJOR58Bgs2zpyXdG7bk06tiEQ/pbaSMToxTBNb4f7QO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375

On Fri, 04 Sep 2026 15:20:00 +0530, Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org> wrote:
> The SMCCC firmware driver now creates the arm-smccc platform device and
> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
> The arm64-specific arm-cca-dev platform device stub is therefore no longer
> needed.
> 
> However, userspace has used the arm-cca-dev platform device to detect Arm
> CCA Realm guests [1]. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel device-model
> details.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason
