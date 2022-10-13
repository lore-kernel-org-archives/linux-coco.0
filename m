Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2045.outbound.protection.outlook.com [40.107.102.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E544416
	for <linux-coco@lists.linux.dev>; Thu, 13 Oct 2022 18:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYSrcYMWSekTckO0RVQrlCuRB4HKusLToe45k2gld2KIQm9z9xnU6NmU6b88tWL6WcZxlSfH9/NPQMwnk+rwjXLo3s/6la0GFzQDqbXdUY5amq7jCQFO59qvtyFXqYEuVvVCSqD3oqf8JaXAYsnwSsRpnbwKeLlrzmgSDwsimJjN8EnlGp+ZDbIX5yoslAvwscRCk+yhl5A5t7ziuMtAPvGIC9cm8s7ByIAT0meQlVJwg47WSK5YcmqD17t0R9DngkrE9AL/TjdbO7UyJ/W8MIsNYWLlOtb7z7kYKgj003Ptfn3HUHGfSRkvNdjAPldUbuJqZuIXvuJmK2BDKpKvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjEtf/4M0oXnW64sgjlahSaSTZ1OEChNOkrlows0pts=;
 b=eraNqDi0/xvQTGnuZVBoQo9m0I2d25tk0deoX0LLF6IyR2C86q3jTu9hC4X1Tm2VHadSBKpmszatYc0JIydcHKE5/8S5gpKzGGlKmuBdKrlxX6d7kfEp2j7gOujZR4WojSAs+rOy/WfGNUV54lokT7udTkMQDtW+4tX6JN0c+3kYgaxgpZmYxb/X6EppFbXX+k6va0dTnfkGZsyIZDGWARSoqcXG6HyG6yeBj6KqsilkGpWbDiPWHye6I6ixUIVxkNLjW7eArxA7QF6c9N9jMnPTjaabjKjCM3mm6NLMCPhiXiF4ptyA/t2qVCw05Gng4zA2WlpOqrWZ1oLFzcE6JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjEtf/4M0oXnW64sgjlahSaSTZ1OEChNOkrlows0pts=;
 b=WupQCuqeN2mBWd1kftRuWsUiQpzLyCQgQwgUGPdz+6xQakxkP9MHblzSmDq//phmSp2KSNG2Kk5wbfxHrBF2SXk8JFe5E7WMuGe61kphj7enY6dAiJpQaLatBCX6mONGAmAOzYSmiwcZAskXBh2K8o2h9ynJnG3EER2hEu3no/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by PH7PR12MB6884.namprd12.prod.outlook.com (2603:10b6:510:1ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 18:54:19 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::269b:c6f1:7b3d:f193]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::269b:c6f1:7b3d:f193%3]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 18:54:19 +0000
Message-ID: <820ddc4a-ac48-00a1-d284-23d08899f1cc@amd.com>
Date: Thu, 13 Oct 2022 13:54:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: jejb@linux.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <b6b22a1f4741a29c68dbdfae59e3fb201e3aa5e8.camel@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <b6b22a1f4741a29c68dbdfae59e3fb201e3aa5e8.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:610:cc::34) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|PH7PR12MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bec0a1f-d73a-4640-850b-08daad4c55d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TchMh2SXmOt3QqGboo4s8jr6+ou/CVAZrkl3yjjCmD+hG1v1mFVcDPVBFkehezfofY8N7fFVHIjSC5FplM+rFy/bl1gEF07WDlj8XvlpEJbohZD3JO7MQvujEfqyh60JuEAZC5zrgMZfWdrzwGJdogft1o8ElU/6ijmuPnRRLZ5WMfs3LkVCjY3mY0ldGmVYatbPPtZk4TytiqVtP0Lhn4qij1d82bBhoDuIwJfSF1fXhleKFqDOppW+K1XYFOAh6+FLmf83vgmAz4hUeLJ4RxDc8lmG5zAqQrlZ+ubwImtCumlM1V2uI/pDH6/1FkI/tsS4ekBcgaMZghN0npz6Rcv3unqG14G3naF+ci/vNftnfLHzpFJtCZT6SqSLONcXZtZWnNhRGjLQLmbokQmm0XqjL2v8Yu9nDnYZbm7ZEkNyTaMlUu4qQK0eCTqv0qMjteY/t2CO2nYBLfOhWU65iKvJhxRPtgxAAqEvSI6+pwrpHYPuJplwTDeM3YeNRvesi67FRyN3OLVyadCbsxWM+7XtOSTohdjkmKb60cTj08OSUi1ItNJP8OlbdRLGNdoQ/hVZgidQKllZ5O4AgRwOr4wD+f5MDe/I5rQtRnOPah6C/xvYojVX1HJr/n9iTID8R7zl+m4388nBlaqClSAkrtTIfwhU3LCBbZfoEM6J9TJW5EJKr4PDKS/t422DsdtR8C4IUjArEMwmCX4pTJMlitTQIoWbnCxxKnb4Nb1r14fAvDo2lIOJMplQgAk8QaKZuKF3yoEXkaZeivpXG76GjpySuFtaIQtDHy/q7sIwVSJukhw6O6fQhMeX0UAAaXIHzAnh8BFIbz2fib0FPAKgoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199015)(66556008)(66476007)(66946007)(7116003)(6916009)(316002)(54906003)(8676002)(4326008)(41300700001)(26005)(6506007)(53546011)(86362001)(966005)(6486002)(478600001)(2616005)(36756003)(3480700007)(2906002)(4001150100001)(83380400001)(186003)(8936002)(6512007)(31696002)(5660300002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJDUnN3RmlYWmpNeTFzei93T0lub01jNWFqZTB0cW9JLzNMRUFleUdQSWpH?=
 =?utf-8?B?dFBkMGRabXVTTnphZXYrSzhDUXQ1Mjd2OUp3SEwwWlE4QW1jTlpDWUt0S2kw?=
 =?utf-8?B?cjlyZlBjc01MUnNhUlliWFpVREtwck1jRDZkejNvSnc2dk9xOTlZcmdtdGhk?=
 =?utf-8?B?OWdXdVpIZHNpRHB0VWtiYTJDQ2tPL1NZb2dSYmRndEhNQXFUSzBJVnp1aUVx?=
 =?utf-8?B?a0ZyazlBWk5GRWhaSkRVUzY3V21GK0lRT1NONCs1dGt0UXY0cEhCbzdQZUx0?=
 =?utf-8?B?WHZ4VGxoUmtlOFlTL1JUbFYyb3ZuQ0l5R25pZHV3M0xSVjFqV1dUU05nUWVp?=
 =?utf-8?B?clJhckd3MUxHVmNlbUdjSUZlUUk4NHVXV2NVeXZWU1gxVVYwbStsWkc4UEFp?=
 =?utf-8?B?d1ZNRXVuRlhDZWJncEZtVHZaejNhWVBEQW1VOU9jeURoUktCY0tFNEl0SzVS?=
 =?utf-8?B?c1lyOEkrcHh6d1RiVkdpandURnBQSElzWnBqbkRRUlhTSmJlNm1IYmVObm5T?=
 =?utf-8?B?eUg0RDdYTitoeGlaWGNtaFlPMnRVRy9jWkh5RlBFMExPdHkvWThJNFZZcFZ3?=
 =?utf-8?B?d0FDMkdYWkUyR2ZwK1RDRHdyT1ZyNnhjdlk3d0JNb09oNVNOLy8zNWZpeFJT?=
 =?utf-8?B?S085MkhVQ1Fvd3NjMGk3T2pVZ1MzdzRJMHhFZlZCTmpvRUNieFhUdTdLNjZ2?=
 =?utf-8?B?OGhwdVpvVFpEZ0J5Rm1UMUhSVU9vWUpaT0ViakVTOUNPdkQ4L1RZWVoxOFN2?=
 =?utf-8?B?UStwZjE2d0hjcHVSOWNmTWZCQ3FqU2dYazR4bDlSQURGUGZGN05pcWIrZHVw?=
 =?utf-8?B?R2hUMXVHbnE2aXFmUWFlQ01pZlJBOUNzWmZiK3BCNVVORFNBOUJhYTlmUDl3?=
 =?utf-8?B?OGZ5aGljU0JZbExVN2lXNjUraFF6TkNHd0hlNDRtS0ZJdGc5L3NZUEJDZmhu?=
 =?utf-8?B?WExKZVNlb3E2bVc1Sm9QMTRJNHpoRTVHRmtiZzZ2M3cwbldPengreUJ1QTgr?=
 =?utf-8?B?SkZKYXQvL1hXSGRyQVBRUFU2TkllNFN5NXpWSUVyZERjcERQeS9lQ2hSeTFN?=
 =?utf-8?B?REJpenFZUHd5RkcremRyV2g2UFpuRTJPTUsxc3RQdW1FZ1ZCOHlFMlJHS3Qx?=
 =?utf-8?B?cnZUdVEzWFFqN1plWmoxRzRoVFlicnRhSlBSVWpJcmRqQ0tidVJLdG92ZFlt?=
 =?utf-8?B?Q0oxQWVBWklpVkZmUHZQbldubTlSejg5bHpLY2tSd1NUc2kvTXlMZ3htbXVP?=
 =?utf-8?B?RTRjNExpVldDS3lWMEFCT0J0Z0xFZ0VHT0hJVmtyVFFwVFNRVW1TNE5Vejlq?=
 =?utf-8?B?NmVoL1dGWlJsdUQzREp6czFpUjRRMlhsWkxTbzdRQ1U3allzZlRsYVRsMEFY?=
 =?utf-8?B?RWZSTW4ySXFzUVE1ZFg2Z2hiL2UveWtTRnp3dWJXaTRUOEwrS3hXT05LUU1S?=
 =?utf-8?B?Qkh3TU01S2w4a1Z4WHg0T3UvZTg4dDNMMkFjSFVOQjh4OFRkd3Rqc0RvODFS?=
 =?utf-8?B?SDN0QnVZU2NzbGxGZTcxTlRuV3gwRkVFTjgrWHpwd1hOb2Rwc2xPdFhrMlZh?=
 =?utf-8?B?V0F1UkRqdHMvb3B4dGF2QTBMdkF6N2diaW8xaFBVU0FwVzhTYVVUdlJDV1NB?=
 =?utf-8?B?eFMzdUEwV3d0d0d4MzIyUFFkVERvQjFvVEN4c3Y0R0xVZ1BpQjdxd1N2aEpP?=
 =?utf-8?B?ekRtc1RSMTdTeUJwSEZyQnMwT0NwNW1idWphRjViSnZ6NTU1QW5EbWVCOTVl?=
 =?utf-8?B?SXZWZG5rM01ZbGlKTVJWQzZ5cWYvUW9wNDdCN2RPQ254eHhXeE1mbGw5Z0Nq?=
 =?utf-8?B?d2l6UjE0bVVFSDNCUGtMN3BPYWxWc0lDRG5yY0dYMnY5WTIxQjFQdGU0enNN?=
 =?utf-8?B?NmlNVWE1amtkem9YODVmb3o3bnQybjM2d1VtZlk5bm9NcUw1ZzlERUdqQ3VV?=
 =?utf-8?B?SUZvSW1YcURudjhKVUxMVFd0VERxeWRMTVhQK2ZYSXdKcnBjVEpSSVBjZ0wv?=
 =?utf-8?B?NWdEdzJhUzUxeXN1bUJ1bUJSd0FyV0tDSFErMUpVeE9ISk13UmVZcmJDZTFH?=
 =?utf-8?B?SzhzWkZsbnN4ZCswYXpqQmJJZm9xSDE3KzFLeXRheVZZTi9NYzhBV0hMVnlr?=
 =?utf-8?Q?6jUXCjZfrsVsxoBUXSuWEm14b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bec0a1f-d73a-4640-850b-08daad4c55d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 18:54:19.7383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnSUXdhUbRzs3pl699P/fgxgrXd/NLqpoV6RVBBqotjvdbMg+UxbiWjBydYYl48mvUgzWL95T6QBNZb67HjE2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6884

On 10/12/22 14:05, James Bottomley wrote:
> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
...
> 
> It is theoretically possible to emulate a CRB TPM with just a single
> communication page and an ACPI entry (the Linux CRB driver is ACPI only
> at this time and responds to the "MSFT0101" ACPI entry).
> 
> The CRB device responds to a very compact MMIO region (0x30 bytes long)
> described in the CRB spec:
> 
> https://trustedcomputinggroup.org/resource/tpm-2-0-mobile-command-response-buffer-interface-specification/
> 
> In theory we could use a page that keeps trapping to the SVSM for this,
> but the problem is that the CRB driver polls a register in the MMIO
> region to check command completion, so even a single TPM command is
> going to generate a huge number of such traps.  So while it's
> theoretically possible to generate a SVSM emulation of the CRB device,
> it would likely be too expensive in terms of traps, particularly if
> we're using the SVSM vTPM for runtime measurements like IMA.
> 
> If we're going to do a new driver, I think basing it off the CRB spec
> would be fine (the spec envisages command request/response being via
> areas outside the MMIO region) and we could simply do a new driver that
> plumbs directly into the nine operations in the tpm_class_ops structure
> 

This sounds good. I think we can model an API call to the SVSM vTPM using 
this. We can provide a struct that looks similar to the CRB Control Area 
and supply the GPA of this struct in RCX to the SVSM for the vTPM to 
perform the operation:

     - Command GPA
     - Command Size
     - Response GPA
     - Response Size
     - Status

Anything else that would go in the struct? Locality?

Thanks,
Tom

> James
> 
> 
