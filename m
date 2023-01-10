Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2051.outbound.protection.outlook.com [40.107.95.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D01D23A2
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 22:45:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxjFx40Qm+uYUcLbe1BgGgUVKpiyHuZ6uC+Mh0Y7vSi9FYoil0jA91N0UG+l+eJmeeQ3dbMCww6Xj7E649KrA3IY3VaqfC98s6yakv79LLHa/wYYHv9F2tY4qq1Uakwta+tAArbDiRSSDUEJPb4xmHvSiE44sgpPKGjtPGsnCrzrNt4800BgnYDc26R+Kw5WwcWih4PhE4CAmY6bxSjXSxV9EQnrJ5aooej9Aj3HYjtDluvn0ebHsdu+UIQnSWg8wYg6mqSoGQNk2D/nhSBfGfC2XWEuAO88Ds+SDUSBOSaMRdTg05lF4mrfVN48jULTzdxctS/3HdSlRAguaGU6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ylLopE3fOKMMa9zTpMHY1Fi/hpKejJcALaDYNqvhKI=;
 b=GZfFVJvfESLBHFmfKxZaB5LYAVhwY4uDczRCZ34f6z9u33TMHr2UBD2NGIMIIdASD2ukELFG5Ie7XNfU6ks2ipXvKK1IXsK/Nyz/fTVKr+/dP9SPRfnMhTYoQ/W2VQ6RGxY4pU21zCZJzXRG5LeH5jmf6d8bJFR5TEOY1oNF2oHAKwgswPi0K/27Va8GlStscFBU5yUquhT3s2dHwhpCSr69yIekQehYwphpAOy07ci+AaTFi0ycHnG3+jqSIdaCjVgxZtf1JcfTuEIX9cxkF7HNuCQx26TNZNhdMl0JJfjv4SJmZ/T7ckQofEd4aVDyu/++04Vr93qd6qdK7G4EPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ylLopE3fOKMMa9zTpMHY1Fi/hpKejJcALaDYNqvhKI=;
 b=4OgMojsj0bUiekKXAYNVObWZo86qOrApNPxifIetSo0QqUTS8dcjnXWhG2zf2f9A2ORLaxCwYcQZ79bM7PoFhVmictAoDl5dP9IVA+6KKlR0q6Ep9VO6RqIKLIptoFGpw9hMKOodW9X/5rM7NDKQhTf/V4J8t/CyIFR2pTeORb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 22:45:15 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 22:45:15 +0000
Message-ID: <09079dc6-e0b0-85d8-34df-575e576e6c47@amd.com>
Date: Tue, 10 Jan 2023 16:45:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: jejb@linux.ibm.com, Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <CAAH4kHa_DN2e4DreB_PfUEsu7KrB64=m5=-HnH+WpnmecoRz3g@mail.gmail.com>
 <804079b5-c090-af4b-ecca-839ab8bea0f7@amd.com>
 <82e9126149127c11a09bf031125edf2ee72a7a26.camel@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <82e9126149127c11a09bf031125edf2ee72a7a26.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:610:77::7) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: 3918a3bc-7369-468a-81b9-08daf35c5745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PD2BAiTTn/Ct9cLxAtLsYIzpD19fg6dtnOVK4neaFVDXgOqV2w71GmZJZR1rgK/Zg96fxSDRPdiL5j21CTf5PXdmYPrLjLmMPXjIlUsVSkfYUplarGCs+cZKRJZWU8SHBwbJx3y2f5VGRORHXw0FcxEW0aRfXsTkVWwY49CK8Zyv5sXDAuGXtrBNX7ffy+71I8NplBECStV3iatB495ftK0u5fYhr4jfh0Z2MBbU0JueBIe5iV/pDD+kO/akSsvOS4a9AXiwKusfGBovoQ2FOYytf5Tkhur0ypie9z3+5lKyCtyjd5Ooz77rM3/G36UhW6uGqW8QITsnwexm1lVB1ls3qbIRtHORWsqxacgKOcFFLmSdWbnywMwPawo3SlIof1U9J/vxePD3fxOMx5rupGSUCK2z2vxN7PqLyUXXr4QKaStpXzmmSmStTNe2/cIYFjsIrHNZLRn8sxKpfPQvQ+lVPhaEh/OrOv2R84XsTf5FzpNhvVpozj2i1LTjy+48A6QWOWwAwAr9/R1b44tRrDs0ZWkOar+Qc5ncUWyyQCeO652QH9C8kJXv35xuBhlFhlIsEtoXb0DPeWrEjsicYS313ttG3xWYVpQpMmuWBiBkCW3dQ/5aCrdn9mRGFxEFSo3RGm1b/S7eW92eJrPy9iGIEVucFGCJKCMFh5mJySJoUkJa7bEsJzJ+l3Hq/cHHEtK1aERrZ+X0XQKpcjSBPVj66V1NzSycoTOKjJO8DrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199015)(478600001)(36756003)(8676002)(4326008)(86362001)(5660300002)(66556008)(66476007)(38100700002)(66946007)(31696002)(41300700001)(8936002)(316002)(83380400001)(6486002)(2906002)(31686004)(53546011)(6916009)(26005)(6512007)(6506007)(54906003)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG1CWUNwRDU0YnZJaUh2R1F3QVNGMm9mWTlFVGhJL0FWRGhWRC9MNkpzdEtG?=
 =?utf-8?B?QUd1dEVqbGpFUXh3d1hZejY4cE1MQlhNY2ttem4vTUJUQk1XQlZzQWhhWGJj?=
 =?utf-8?B?TlVDbzlpbk5KdS94Vk9WQXpvWTVwcTBmclN2cTBrLzkydnN1RXlUS2JKWElQ?=
 =?utf-8?B?L0lqYzBqQkwyTlUzSzFRUWJYWnRkRXZUd3V6TU93VEpEMGN5cDU5TG5ER3M3?=
 =?utf-8?B?bTZXMnNPKzdhUmJBVTJjYTRjcGMzOVZ3MmkycWluMkRzUEJXUjluTm1Gd0NI?=
 =?utf-8?B?TlBlM2ZuLzczcFFDL2xxZlgzQ0ZOTlNxTDkxblovTTFBQkxHOThMSjVYTEZ4?=
 =?utf-8?B?UUJRLzdDdlVJMlJTSys5dFpUTkVJMkEwTTJKemxaOUJSNnZ5RzM2TTBiV2ky?=
 =?utf-8?B?K1JFRlpXK0k5aVhpTTc1UXF6WUNqclloaDFmbDNCb2hZQmJxUmJ0MHAzd3ZX?=
 =?utf-8?B?OWxyMDdCTVoxYkhiN3BvY0hFb1MrbFhtQzg2WFpoTGJ5aXVDQ0sxVmxqdjVW?=
 =?utf-8?B?UExzYXI4OFhsNzE0bTA5RkVsa1RveXpBN29QV0tlZjk0M3lOZjV2UEtDZmFv?=
 =?utf-8?B?RTA1Tlpibk1PY2lrbkY2RXpJbmJ4MTk2SWV2YjhnckI5REtMOWgrTFlGNGxX?=
 =?utf-8?B?YUMyOHZrbklTZ3dlb09FUWpURHgzK29rTU9tbUMxc0phS05BQm84L044S3ZN?=
 =?utf-8?B?SHlvWWEzMjhQYWRvZ1JuS3VNRTNybXZrclVzOWJkbnFIWDg5anpXUEk1MUJR?=
 =?utf-8?B?S2xoeW11a0N0MFJweC9HREQyQlNKYjlySmZra2UvYnE2MW1lY0d0NU1FaFp1?=
 =?utf-8?B?MTcxcm1SQUo2cHFYMWhmMFB2RXpCbURRa3l3U2dISlV5TFcrK1FqTHJtdWd6?=
 =?utf-8?B?cjBISm1PQ2lhRWt4N3p3cnByVUlSakIyVmptaHlmVUtNbUdEZll2bFI5Y01n?=
 =?utf-8?B?L2t1cWdrUFdML2wxazdtdldkajV6dXNCYldGcTdHSTZ4U0EvNlBsVWRULzFD?=
 =?utf-8?B?dy80Wjc4VGJzQ0hIUDltalF2UjJoUkRpTTFjK2taNnV6c2Z0UWkrcm1VdC9P?=
 =?utf-8?B?MDNiYW9WN00yU3dvRWhOaDRSdnhIMGMxOTJqc09xeHhPQllsaDJ4d2pHSm5Y?=
 =?utf-8?B?LzdCcDFSL29Kc0txVU1LOThOZG1CV2ZTN0EvSjhpVjZMQ2Nyb2RBL3BNaTlC?=
 =?utf-8?B?azhndHAvbDdUbzR2UzJndEs1Ni9Gc1BzbkdDaGU5Qi9oZ01DQmNnN01Rd1R6?=
 =?utf-8?B?UGZlWG1ybWh4WVdBcUdvYktEN2p3NzhTSlc1c2t3SHZpN0FkdDBUVCtCVVYy?=
 =?utf-8?B?cngwazUvY3pWNGNFMURzUHVWT3FDeDZTaFRjK2tLWVV4c1RBeE9ZY0x4OVgv?=
 =?utf-8?B?V0VYdjJ1eHE1SXdrZUFBRzZqUkJWdWZ5Q3JCbUg1bGYzaTRpeDB0V1pjU0h1?=
 =?utf-8?B?YkFxQ1pWalJld3hNaFBwT0Y5RnZCQTVmQzI3SjFLUnphRVJIbXpkMHdlN0Y4?=
 =?utf-8?B?SnB3ZEVlVVpVaUFVR2hiRWcvZWlFT3VNV3hxcTdWWEk4TEJ5ckVzelV3Z2tT?=
 =?utf-8?B?NmZtZHBERE5TRGE2QzJZL3AxVmk3Vm4rZ0NleXluRFFrR0dMd0RJNUwwYzc1?=
 =?utf-8?B?N0UzeWh5MW8venZVL0wwU1RRREV0L3F2YkEzMlVIS1BKNm9MNDdDdHJCLzlu?=
 =?utf-8?B?a1ZRU0VGcTFOa3Ewbm85aVhBZUNOVHlHR1lEQnhzcXJINkVLZzgwaFBKdXI1?=
 =?utf-8?B?T3IwSXd5aVVJaERqRTh1OVExOXhpOWpJWmxERDU2ak15Qm9PcjVTRzJDOVg3?=
 =?utf-8?B?KzY4YWFaT2U1ZGYrTFladXJQa0dvOTdQMFZzRnJaL3AzYmJidCs0ZjI5emFY?=
 =?utf-8?B?ZjNMU0FlYW9UU1dITG9zRDlxc2xCemFpbW4vMEJ0ZjJPTWtDWkplaERUbVAv?=
 =?utf-8?B?NmNySHBuN3lpZDhnMmVlQ0ZEaHFCc09LYlQrSmRmY3hmSmIrSXZoQi9pL2Ro?=
 =?utf-8?B?RXY5QnAzWkpSQ1JyN2puRXdoZEQvT0JjV0N2dWk3NGdZbnl5VjVGM2ErMnBP?=
 =?utf-8?B?K21DTXhxYnBxZVpWZ1dzaGEwdzI2YmVGeDBqK1NjdzJqQjdiQUUzWGRRbmVn?=
 =?utf-8?Q?HArIFIfbIHUmjjze0O2B2+iZY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3918a3bc-7369-468a-81b9-08daf35c5745
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 22:45:15.3998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epEOh6t7N6XDVBAMSUl83qtilKLHHS2Jv+aycrOh6eGN7nkDCHpyUaM+IRj+2WPPO8ATwMHr6elZ11O9JNY36Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367

On 1/10/23 16:14, James Bottomley wrote:
> On Tue, 2023-01-10 at 15:03 -0600, Tom Lendacky wrote:
>> On 1/10/23 13:40, Dionna Amalie Glaze wrote:
>>> typo: "oridnal"
>>
>> Will fix.
>>
>>>
>>> For the statement "Locality usage for the vTPM is not currently
>>> defined." should this be interpreted as version 1 of the vTPM
>>> protocol will not support locality, or simply that version 1 might
>>> have the affordance to add behavior for non-zero locality in a
>>> future revision of version 1, such that the result is not specified
>>> as SVSM_ERR_INVALID_PARAMETER? I think the latter is probably a
>>> dangerous interpretation unless v0.60 of this document is strictly
>>> considered "unstable" and shouldn't be used upstream, so I'd
>>> recommend clarifying that "currently" in a document that might
>>> later be outdated should be precise about its specified behavior in
>>> a versioned fashion.
>>
>> Version 1 of the vTPM protocol will not support locality, so I'll
>> remove the "currently." If locality is to be supported, it would be
>> in a post version 1 of the vTPM protocol and will likely require
>> invoking a new call id (unless we somehow manage to figure out
>> locality before v1.0 of the SVSM specification).
> 
> Actually, that's not entirely correct:  The current SVSM vTPM
> implements locality as a number just fine.  However, if all TPM

I wasn't saying it doesn't. I'm saying v1.0 of the SVSM specification 
won't support requests with a non-zero locality since we don't know what a 
non-zero locality means.

But this is a specification for any SVSM, so the current SVSM vTPM is 
relative to what you're working on, but maybe not what someone else is 
working on.

> consumers can access all localities without restriction locality
> becomes a totally useless thing.  To give a meaning to locality, you
> have to have some restrictions about how components can access it.  The
> only current user of localities I know is dynamic launch and that's
> usually done by restricting locality 4 to the CPU microcode in a
> physical system.
> 
> Until we can agree what dynamic launch (or some other locality
> consumer) might mean in a confidential VM (and that the SVSM can police
> it) there's no real point wiring locality up in the linux kernel
> driver.  I mean the linux kernel itself doesn't use localities either,
> it just sets them to 0 unless the TPM indicates a different default
> value.
> 
> If we do find a use for localites, whatever we use them for would be
> described by TPM event log entries, so there would be no need of a new
> versioned SVSM call.

I think there would be, though. Right now the call says any non-zero 
locality value returns an error because, as you alluded, there is no 
policing by the SVSM. The API suddenly starting to support non-zero 
localities breaks the API, no?

Thanks,
Tom

> 
> James
> 
