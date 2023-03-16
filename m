Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4084CAD32
	for <linux-coco@lists.linux.dev>; Thu, 16 Mar 2023 21:12:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mY1xOoKsH1DDoX8IzP3z4IutbSSWmn+t1L6LQEFD6Why2+37g2Ljy0On2sg4FXHLJwOtnbKuRdFbDO6053Q54FUulbuzds+J7BK0GqV7PIQHaVLmvY3DKxt4Ye4y7tW/frQ1PPYboc8mShYt8I5nfqVEMTA3LUWVE+cuP2Cl7c1CqY2ITPKdk5elv9ut+0teieTUoo1okfjkhUFf3U131H2uRnsYcbfQkWCSzq1FRB1SU2+jYPJFk0N3/mAxsQn32hKkDQiNfNfYK0fiKOfLeA2fEaQjHnkKUjagIF9vVXDiT5kVY61Rl49FpqnL6b2LYKTdQ+W7AUdBT1ke3FpuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+fM1LumEzjGszFsF8MmA2yJBC4yrCZCoU4G5OkK9X4=;
 b=Maw8GysciXd+VKNrNOhUAEkgmfwlxariYLWXt1RbGi1g+XCL+VWKglDxJrqMz6fEG6//NGOi3o+SbBJGfpTEhjiPlXJxcPDgr7MgLMyaj5gzQ+KViErIcIrkZQqESrucPmFoxm21rVvOXqYJUI+ExoJdjDcpiG61VlQl+xMQsugDAii0iuDonzUKsM1EOGGsMTxWb0R8I8Z44BdSH6Q1NtabOIJJxfrcfU/uvn5/AZOtYRjlE7ABe0plQ6U3OzDRoiYDF85ygPFWcaER7Y14OAX5GxWYvvHATCvKFzGGGlquFyfm9ggUqoykJpH21DHBhgxZQzBGDtv+QIFDcp4ELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+fM1LumEzjGszFsF8MmA2yJBC4yrCZCoU4G5OkK9X4=;
 b=MXV/U+SORGRHH+LoM7eB0oRAOuXuHyCqLH3LCpGLxKVi74Lyuk3ZjzQ+YYA1pe7m4oVpnYpLTGF0aqc4mGq0pjFa5Zh7VAYO5U+F8FOfHkkO2oCLzywerjbiGz6+7fVvQSiyt+S9JWQGWP5Dk/9mKpHxkqmWgJXG0Ehy2O5CN6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by MW4PR12MB7239.namprd12.prod.outlook.com (2603:10b6:303:228::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 21:12:09 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::5b56:bf13:70be:ea60]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::5b56:bf13:70be:ea60%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 21:12:09 +0000
Message-ID: <176f91b7-dc06-88f1-dc78-bf3f3d2dc638@amd.com>
Date: Thu, 16 Mar 2023 16:12:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: SVSM draft specification v0.62 / GHCB draft specification v2.03
Content-Language: en-US
To: Tom Dohrmann <erbse.13@gmx.de>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <a2f31400-9e1c-c12a-ad7f-ea0265a12068@amd.com>
 <ZBN8jz867HNLHVuj@notebook>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <ZBN8jz867HNLHVuj@notebook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR1501CA0029.namprd15.prod.outlook.com
 (2603:10b6:207:17::42) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|MW4PR12MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a8ead2-0750-4672-c2c1-08db26631a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Abg06icWKvM8GhbQSIKkIWEmkq48at9aS9LjU/IqaBfz4Jj6T8WAdqGtp6XCLUeSuVcYd1WxAW32wjPv9pse4y2CCcL/z54yDs8Mq9ZwrgMlBG7PsrHf4MTNLxwKR9pPRMVQgdDzn0oy67PVYXia8NGhQTFe5ECE+UPBYbJir6aZ0hufO/1TUEP6b7LwM4KRPl2+74JlF9KHPn0p+ZT6/fNjddYdcye1krtQzKol2QMAKzj/bcSuo9MrCOfu9MPK0UoadkdpLxkxGx3u0Xs7DS15Fe90GnDSVM1fVm/VrpdoZMRhnaP5v58jwfMQked6Docpy2grU/C3PZ93Ui3yDEe2s1nqzZI7iBmvDLNqNey8oXPOUZX0cYG6qtAIitQyT464iWCviHt0ZYj9f8W+Eje6vGo/w7yZmj9UizrbYp+nvewupn4t/lLSbc62e2oIaaZEoyeVlAONYKHeF9zyPKujUK4BpZ6WiL8d6a0/je2hpFsHr4mk3fZLeCVDoFj06mI/rG72P89Cl8/tujHViSr8NpyicRsmHt34ZhXq42shUqPVVizOoTOB3AvUK8a185Uf5yACHNLd5ZgKZdRJL7fOxvhGzIpO/Q0YDU0VgVAvN3Cki21T09xYAlJI1IUmoxvTjyD5vwnpjGszZiN2vmOthB2yo62YVTTdVGESAUfrbnBPJq1QfjQ+RloJMMI6zmRWVzA3pzqun4EtgM+0b6EWIoJoWY9sS/HxeSso8j0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199018)(36756003)(6486002)(4326008)(478600001)(8936002)(66556008)(2906002)(41300700001)(5660300002)(8676002)(54906003)(316002)(66946007)(6916009)(66476007)(31696002)(86362001)(2616005)(6512007)(38100700002)(26005)(186003)(6506007)(83380400001)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTVnZlZJTjFsY1pZNXduMXFzUFE4YWEwdDQ4YUZieVFDY2o2cmdvMjNjNWlh?=
 =?utf-8?B?d0pTWUZiaUZwcElySC9CZTRNUmkyeFpocUFSUmNMNGJyTHJFTys4R2JVK0Na?=
 =?utf-8?B?VnlOQ1pIU1lRbWgvV1dBbDlMSy9VdXZGVjMvT3dqMXI0VXJnRnVWdGJsZ2h6?=
 =?utf-8?B?SVBRQStXaHNmSHpxd0FpV2RUK3M2VjFFSVViOXdtd2RLQzlaaHNPcmp5cVJh?=
 =?utf-8?B?aFk1YmxaVDdrNzU0aUxISS9YV0xzSDlxdVFjdERTblg1Wk1SMzFnbTF0cjJy?=
 =?utf-8?B?U1BpNkFRSXBnY3dSMEJUdmVMSVNTclFwcTFDazNJN0E4S2E1MXZVc2wzVkRD?=
 =?utf-8?B?c1I4c3U5UGFBOTgzYVZlTS9VNHNiemtTTDM4R203WGZ1VmpNZkliVk9zUkMy?=
 =?utf-8?B?SHp5aVRkSlRjU1RkNWNZNVdvV3hXMTNFNDI1MkxjeUdsdytaN3VJaUY4ZjRX?=
 =?utf-8?B?bjZoeGlUeXdRZm1GK055SitHZEg0cDFjSng3YXgvcndJZm5QL2hXT0FWSDB2?=
 =?utf-8?B?Wk43TFdvSzlIWVJuUldMR0M0bUZjY2VZM3JQK0E3YUtLdTRENFFleERNWEdT?=
 =?utf-8?B?aGlEZHFsRGJrSmIwTHJuYXRIUXNQRFk2QWVGZDk2dWNBM24rZGhjUTJuQS93?=
 =?utf-8?B?SlpFMjVTeVFiNnVMbDhGOHZuQmRENnFqUS8weU5BcW9RdlRPbUw1MmhzeTh5?=
 =?utf-8?B?TlBDeTNUSFhZSCtVbSt3eTkyVGF2VzZiaUxmNk82Z21yQmtUeGhuWDRCcTBs?=
 =?utf-8?B?TnRJUVJ3QjVUVE95ajgzOHpxOG5rN1BZRXBjcFR5NWdqRUU1eHNzQVlDdUFN?=
 =?utf-8?B?WUxFOFRDS2tMcC83c0x0YnpzMitiU2p3M2hTYTNORFBsN3E3OHFyNyswczM0?=
 =?utf-8?B?Z09JRjlxMktWbmlCVCtKaFFQVXZ2MUI3K2owZjlMYXgrTlhsaEY2aDN3cm9D?=
 =?utf-8?B?QzRCUU52NnNlbVhDd2VQOHBTUTRYWTl5MnBRdjFUdDc5SmVNdUQzdEN4TnQ0?=
 =?utf-8?B?T0h2a3gzVU9ZWVVJYnEyK2ZzWm8rcFV5UmJUSHhSMWRHczJoUFZOU2FVVysv?=
 =?utf-8?B?bENYdktvNm1RU1o1NmVDWEUraG54b052VmZyZXZFRUthMFVsbnliYStaZVlz?=
 =?utf-8?B?WEJ2VnRwdERESm5LMW5GeldPWlZ5Tk9ONDk5VVQxR1lzb1hXelhlRktBSDVu?=
 =?utf-8?B?MTBPdEV0YU9Hc0UvVklkZ1gzZXVhT2JNS1VXaWQ4dFk3SStHNTZtZGl1Z2VP?=
 =?utf-8?B?TFhISit1eUw0NHJZU2JxTmx4d1NUUDRuSmpVelFpTXNtbG96ekhiMmFRSVpY?=
 =?utf-8?B?cDhvQ1M0UDhtcU1kNEI2SG04TUsxd2d4WThVU2xRK2FmQ01rWGc2NTM4T3Rs?=
 =?utf-8?B?MzFHcGV1TzlqUzFyS014VFV2NTlpUlJTOW0zanFRenJNNHNnZDhUTmgyZExY?=
 =?utf-8?B?TjJqQ3daVU0xVTRHY2tPY0dZaHZNYllRaVJOL0RINGQ5WW5GWXJQZlRhK05C?=
 =?utf-8?B?T2lySXRQQ05jeUl5MjkrbDVUdHhISFNpUU14SGZEWGJsSDBuS3ZCTU45QUh6?=
 =?utf-8?B?UjZIOW14R3RFUXBoVERUVmZEVVhWTDNOUlJXUWFlMy95YVdoSGNYeWRCQWhr?=
 =?utf-8?B?QkhJaDUrN2RidEEzUGZMM3BUTE8xSGIwRGxEV0N6WXk4cmxvbGQ2blc3d2tQ?=
 =?utf-8?B?WXRQZElwZWQrZ0tmaUFORnRBVFFRakdCL0FaQXFvVlhEaVY1em9ZMFdKNm1E?=
 =?utf-8?B?YmVrN0txcjZUZGFVczcyWVJ0TVBhamNhRlZBTnRPaER3a2lybTc0SUlkcFRt?=
 =?utf-8?B?UmcrMFNlbkZaa01CNENGZWttdXlnc2VoVU1IUjdRSGE1SjYwaXVxRVUwcWl4?=
 =?utf-8?B?d3FXaXVmVUtQaDF0b0J0TWJmZW4reDVzZXRRbDZDSzZoMlg3SlhESTE4UFpx?=
 =?utf-8?B?SXJEcUtQNzU0Tnh5RDdlU2thNVhvcE92d2FXR0JwMDM5ZmJYRnNlTWFJdzU3?=
 =?utf-8?B?RGhUVm1zOVNMWGk0WEJjM0dmbm9hNVlVZEF1WmVER2VkWDBXbytoTkZyK0NG?=
 =?utf-8?B?M2FaS3Jtak9Kb3hJeWgxYVZEMEFld2VNWlRUVjdYekN1MExEbnl5QndiNjhP?=
 =?utf-8?Q?AMka4jbtrTl2yS8pfYMg+vqw9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a8ead2-0750-4672-c2c1-08db26631a86
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 21:12:09.3745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dATFru3273idTt/CLAOjiNT/z67WGV0pC4045H7+or7mf2ArX1eLmHiLCGk9MAFlFQxKNQAXoSQjVZs3STgMFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7239

On 3/16/23 15:31, Tom Dohrmann wrote:
> On Tue, Mar 14, 2023 at 05:08:17PM -0500, Tom Lendacky wrote:
>> Attached is an updated draft version of the SVSM specification with feedback
>> incorporated from the previous review.
>>
>> Also attached is a draft GHCB specification with updates for APIC ID
>> retrieval and VMPL/VMSA level execution (and an SEV-ES enhancement to use
>> the SNP Page State Change support for working with UPM).
> 
> AFAICT the new GHCB spec explains how to run a vCPU at another VMPL,
> but doesn't contain any information about how to registers a new VMSA
> for a specific VMPL. From looking at some of the patches used for SVSM
> it seems that a new field in the AP Creation NAE was added, but the
> specification wasn't yet updated accordingly.

Ah, you are correct. I missed pulling that change into this version of the 
document. Thanks for pointing that out.

Thanks,
Tom

> 
> Regards,
> Tom
> 
>> Please take a look and reply with any feedback you may have.
>>
>> Thanks,
>> Tom
> 
> 
> 
