Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEDB2906
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 14:51:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0Bu0V3aOUgXv9aJHZYVIUqdst7KmkwUonNzcx5ejMnJw/YpFDGOEu7x0ZKCtJawbN48coblMtbbnml+IAAcJi1K2nKwLh+4NzNWVsU+usJf7ne4T5nNKjqcSzv/7BO4cnWTk3hVR1Q+Vf8UHSp/g5bWc2PAW4BzconTLZ8/GHv0NABIHKodKyBFsr0P8+4oGXBAmnyhvWVmF6M+FCCjWHRrvpKvbkdP5cmW4bi+c7A0ACgBAms+G34QNkHhpyqS5B4d8p1+hhNU9wm9IBjDYr08LpI9MwDmCmUhR4VNxyEaMvf2VanbwoGpKS/i2mhI9dZ+BUr9oi1FHSiIAfMp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSUcgdy5BwZKFRHG7qbWrwsYuMOB0YBrruFYjcoxZ90=;
 b=NUyNaeWIrQItLtpgiQe9YupmpBOtq1th/aoJj1piPYmmUd5T6roaXPjmz/BMJo8ywJJyL0ABMg+po7wMfbgXMik84LpIBXJ9V/dsZK0TDkOTO6H6SYr23jaiaWBSUIdwK+dNhJNu0BhRzdjcuEPf8ea898OeiLOBW3b2nd0E7VTM3I5K0mwhyCxMrx/+xYNQRQzLvWbrQXMjyMtVQN7JUct/yobMlD6v+q8gs88nk1aiWDioPDkSVTO81oGgFir46kHedTCICVUD1ntnn1p3ZkNzakOd3Bl9lLNgmceDdtV65If+Piox/L1OFc5jd4Uf4/JmPzpcgdOmD9mm90nckQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSUcgdy5BwZKFRHG7qbWrwsYuMOB0YBrruFYjcoxZ90=;
 b=VZE75WQqDEqqSAuYhc/MONFCYONAc6Pbwsev2ygjpQ0rBDXM+sIIJxRIuUySlXDB+yW6aMHnaNGwjhLSLx7in4/Et17rOG7aqqQrAio3yTWTPyrFzv2ra+5hbO6Vwv0q5oKGkDEmmJKtilflWJI4IuGc4wxr4ifL6e91JFzPi98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by BN9PR12MB5130.namprd12.prod.outlook.com (2603:10b6:408:137::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 14:51:32 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 14:51:31 +0000
Message-ID: <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
Date: Thu, 26 Jan 2023 08:51:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+oqoU2jZYrNlz1@suse.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <Y8+oqoU2jZYrNlz1@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::16) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|BN9PR12MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: bc61092d-b68d-4935-2756-08daffacd008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xxIbDkx4IUpqo/s2tlG+UytkOkQRV0Ss3kY7KTyzL1gBnBs1GTCMVhervhjA4tegKjDkwITx7kW5a5UYXA5auLDmAtKqK/8Zbhuo7Pu914VicBKwhHYPXddmQ+fBjvZZgdIcMo/YCQ9TZTDHK/r5wftsfoXrVOOAbXACkxJOVisib/6Zjr+T6Yv68Iq/whtrf0Jdx3VhwwLpje40Tl+WoKMSvAQlIrfIJ1ainnKXGmaO3AhH1vniMLa9qdur6vgTKHzePUJQIm/yu0tp1gHpLXYkOtDycmk1JC1Ho6lFAQBtepySCy3vAw0JOBQBNHfCNDk1a72XuTfc81/AsGgAQow2fW+ZWAJzr/a4tH9FSK4RYOqpwLszW1Br8+qr4yeQy3A/cBBreYs1yoyRWjjuuwXNU6iYik+8ze1OXOUmFx1Xz/qGi2g8YHDTyaj3MHr13yI5MRIMiw7/9kNMZzowQoaJ0/KLY9E44RYSTOdcfU0k6EbkyDDKiXJWgGnqHp9+ba5I3+7KqeVeAiz6196spSr4C6rX4Hwcy57Bro7VwiLA91yKxd76w6ofcgCUGWFQu9S4zIFau83b6FFj3ZsVAJsOG6HpgQjZYdJwT+tI8sI5A6+9dEobx3pTopDOPMp5CQlENhmw9CWy6OH1Ayz/58LQa6I7OAEw85/DYSeqTuNWwAGm4Du6iPUZy/tZedOchnFpfg7D5Kfh+4qxXdL/f64QGQrtY4Dz2sQN2Ol3Yzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(41300700001)(8936002)(26005)(66574015)(83380400001)(86362001)(31696002)(36756003)(54906003)(66946007)(66556008)(66476007)(6916009)(4326008)(8676002)(38100700002)(316002)(2616005)(6512007)(186003)(478600001)(6486002)(53546011)(6506007)(31686004)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTVSaEVCWmZ4SGxrekJTdkZYcWJsMFU2QXZCVmFLd2lxOThZZVlsQ2o3Yk1s?=
 =?utf-8?B?VUhRamFDdFc0azhSNGZ4VDZ3dGRNYlE2eUo1b3lHQ202ODNsdTNWWUZvc0pR?=
 =?utf-8?B?eTVkUnNBcDFSN2Naak94TTd0V09qWUs2clNsQm84THJzdDdMSEZaeTVkR1FS?=
 =?utf-8?B?SUVIeDhvSlZmaEoyTmp1UlloRlpZSHBEbEZsMjNGOWlVUkh3M0wyVnBMLzdZ?=
 =?utf-8?B?VzExRUJtYlMxRGJUTS9TMk5zYW5WN3RQZmZSS2YyVzEvUWZLUEJrUEllOHhJ?=
 =?utf-8?B?WE9QYm1HWEo2T3ZDbVdsUDhHRmYxbG5hWlhWQ1BsaCsrZFkyVVA4cVN1b1Fi?=
 =?utf-8?B?dkRsQXpFTmlSNllGMmYwODREOTJ3VFZCRE5hTWMwdTlEYkc5ZWVDcTJ5NHlI?=
 =?utf-8?B?NVp3aUVRMU5jU3pTcUJnbHdqUndvK1lJc29nVEN6cFZWRkwyckRxUHEwV29o?=
 =?utf-8?B?eWUrUmZkOUo1cFdyckZvVmx2VkZEWkw3S3h0QjdjOXFDelM1bnhsL0IrR1NO?=
 =?utf-8?B?eXVVZDJtdDJzd1U2RlNDRDdSand6Vk41b3BsZFVPN3VnOHl1VHJKU3VsZ21y?=
 =?utf-8?B?WmZCN3NaZEEzRVVSeEx4WnBUdjVONm5DTFBxS2FBVXY3UDYzcmtad1V0REF5?=
 =?utf-8?B?eENFT0pEbVhPUk1MRHMxcjROWjI0OWtiQ29xUGxKckxWenlpVVNWSlcrMkF2?=
 =?utf-8?B?OFA2bnZZTG5ZQWwwWGxIY0orZjB3bDdMemdQV2hTOHcyM1VzNUpRUjBCcTZi?=
 =?utf-8?B?R0I3bjZMZld6TllrQzdtdlQ5RUg4c3lTbTFKdzFEYk9RdU5NbUtaNW15TXFM?=
 =?utf-8?B?V255aDFZYmIvQzBLQjZEbTkrTHBSWDdUcDU4L3JtNG9rZjcwOThzK1NLaml1?=
 =?utf-8?B?VFZOelFBTWp1U2Fpb1ozdEpzbXdBQlUrQXdXQnVPNEdnM3NHYWVibWpESG12?=
 =?utf-8?B?dEVGNSt5NW9iSnZxUHVIZ1RkVUFVUENVUHV5b2VsbWZ2WXdFeWRucnRDTmg1?=
 =?utf-8?B?M29NcG5NYmxramthSklNbU1mbFlhOVhKTDQ5TkxsVS9WV01yaGUyV2wzZXpO?=
 =?utf-8?B?M2NtRk5wanl4bjlReHk5eUVKcUl4VE13aGZ6djdMZWFhWnpoSi9NYmhmcnVs?=
 =?utf-8?B?YVpkVFo5T0F3NzZwSXpIamE0WmRWdWJ1SjdlZ2hDNUJzTlNHNDBvRXh3dDMv?=
 =?utf-8?B?dWZjUEhuWWpuWU0xLyt6S3pPQ3ZROTBJbExabXo2NVViZmhpSnJvN09uUEE2?=
 =?utf-8?B?NjlIUzdiMmg2N1AzZXoxcHNvcFVJb0FCNTBWMUhsOU54bjJTTU90dXZIZ2s0?=
 =?utf-8?B?ckx1c1VtTk41bEx0MUI1UEtSaWQvUzVDYXkzcHh5djU0TjhxZ1pDYVRDQ3Z1?=
 =?utf-8?B?SGZ0TE5qd3B3ekxqSjhiNitmYU1kMjlTRC9GdTNXdzYrRzJFMmtyQ253QWpW?=
 =?utf-8?B?ZUdHN0pBcmYzNGorM2xySU1oT3R0Z0ltaTZlZ1d5dWRDb2JRdlZ2Ylpzc3NK?=
 =?utf-8?B?SndITE5yY2t3M2JqZ3h6MXN6Q3gxbCtjbWZ0K0x5ZW5pSllKdSttSGNibzdQ?=
 =?utf-8?B?aWhtNUdxa2ZFcStjZzVaQzZpMDlDbFlmejV4Q2lJMWpJUEFCZ0QwQlhPUnZx?=
 =?utf-8?B?bVowL3VVN21hMGVzKzhBOGhsTjdPZFdzcEJSeGpwUFU4SW55L1FhMHdxNzBa?=
 =?utf-8?B?L0lpSGpVVnRwK0F3bW15VFM0dWNHQjN5K05Jekpiby82Y0pzbWM2bGpzZVhB?=
 =?utf-8?B?bEkvY25SMFpUS05PQkF5MU4wUWdkK2xDS1hWOGhCaG9YNGxucjEzbEpnUGkv?=
 =?utf-8?B?N3NMdStDcmY4WmM2UXRnRG5rUC9Ud1Z5SUIxVkVBa0Vqb0VaNHdBSzZwZk5O?=
 =?utf-8?B?bHE0NGd1aXdCcXMvZTQ0SFZIZzIxSW8rZUw3ZEhJUUNpT0oweElDU1Y5cVQ3?=
 =?utf-8?B?bWk2cG1GSXZDMSs3QkFvaDVId1I2QUVHQXh1azFKNjlzdWprcUVFRzJYZE1l?=
 =?utf-8?B?RDh3Q1dLMGlvanhma2FMWkhFOVpXVGdKaFFFRmlVY0JEWVYycmcvaTNMTDY1?=
 =?utf-8?B?QWtCZGwxSkdIV3NXSlNxa01xelBycDQwWFMybmNrTGk1YnlkYnRXNFlXMnVZ?=
 =?utf-8?Q?E91EsVjPoIySQLOJ134vgWmdd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc61092d-b68d-4935-2756-08daffacd008
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 14:51:31.8030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzfbRGaawK1iB//KVT5JZoLZwTLdJ+FgYKi4ttHRHZupjiQ848jGKBk69eMMkIHp7J5SwDP17ao/adiSSJ3Khg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5130

On 1/24/23 03:45, Jörg Rödel wrote:
> On Tue, Jan 10, 2023 at 12:54:27PM -0600, Tom Lendacky wrote:
>> Attached is an updated draft version of the SVSM specification with added
>> support for an attestation protocol and a vTPM protocol as well as other
>> miscellaneous changes (all identified by change bar). Please take a look and
>> reply with any feedback you may have.
> 
> Another addition I'd like to propose:
> 
> It would be nice to have a protocol number reserved for implementation
> specific requests. The protocol number only defines one standardized
> request to identify the specific SVSM implemenation in use. Other
> requests are implementation specific and can be used to manage the SVSM
> from the guest.

Would returning an implementation GUID as part of SVSM_CORE_QUERY_PROTCOL 
or adding a SVSM_CORE_GET_IMPLEMENTATION call to the core protocol be 
better? Then we could reserve a range of protocols for use SVSM 
implementation specific protocols as opposed to just one. Since the 
protocol ID is 32-bits, maybe make 0x8000_0000 to 0x8FFF_FFFF be SVSM 
implementation specific.

Which would folks prefer? A new protocol to retrieve the implementation, 
modify SVSM_CORE_QUERY_PROTCOL or add SVSM_CORE_GET_IMPLEMENTATION to the 
core protocol?

Or any strong feelings about why this wouldn't be good?

Thanks,
Tom

> 
> One use-case would be, for example, to read the SVSM log buffer from the
> guest side, but depending on the implementation there could be more
> requests defined.
> 
> Regards,
> 
