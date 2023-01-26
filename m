Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FCE1107
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 14:36:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VObG4XhQuk1dlHtxmKXa3PZq81hqwTGIdFkgpFGUsTEA+vN8j00LCODk7txan5hzd/GkhjVo6s24wBbt+WEedVYvSR6worpV/lq2IzxxW6CGfC2yJLA6Ygk5+qqoiXj7Kw7ygt2anL9m/p4lrfA8jJ+INjOmf5eepT+CuY257Jf4GFe/G+vAg8K3TfMMr3E2yxg/D69ooAsss1cKX49PAUq5weNyDW8U+BeZq2malz+lY21pyzdilHtZNIcrxrpjRqewZOjKkgGCIWC4p8h/hGwOTYAHibepOfArm2hMqxmxjE6/Qv03P4N72VNCAvp6ooD5xwUWLaW0eo+r5T4INA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UANHnD0io1UQDz0vKt+SmzHMEyfaLbVa9cD9Ae/WHEA=;
 b=fsiZpdl/PhWxiKkA2q+uLceqqGnLZwXxntPLdKLhAngx2alZtkxCHo/ToT0DKdXd5exLWrCYD0DODWefSAkPY9OfZSSl+rukiWSYYHAK6DJ7AXzjTYD1KS8bPegY71NEelio4w42Ec3qKVVFP2+mi3q98y++hXYCtzlQJ8JC64GF/YQRigQJCuzFQ6FydG57OyhyAzeb6xnNNhJGUPQ78pk4ncRHxamGJkxaLmLxsaMzfpDXJK4TL3oFlFhnEQpHIxxCi6qJKsy22A9ItkP41wiCxbsO7z4MS7Pzv7lvIhOiOuA+lGjmmxWpKYbv1xgJ5pPavVQSiQ/9FY62+zqO5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UANHnD0io1UQDz0vKt+SmzHMEyfaLbVa9cD9Ae/WHEA=;
 b=2CT9sbI5KZJMJfayd2cRCTApBRqkVjaTiPFiWlL9QkInQkWk9hwwyLOz8lHf1O6EkW/qmdwChx6Sc6dy4KqfNERThqtFlTmCNJO49/uOvYRE1uoSHmFVd2RzMoY0Nub52nVJvaAVAdz/DGN/oFL6r86jOLuW3kb9Czxft9yE31U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by BN9PR12MB5066.namprd12.prod.outlook.com (2603:10b6:408:133::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 14:36:11 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 14:36:11 +0000
Message-ID: <dfca5ecb-b036-c9fd-f571-ec860f38eadb@amd.com>
Date: Thu, 26 Jan 2023 08:36:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+mdnCrn7sNCcMt@suse.de>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <Y8+mdnCrn7sNCcMt@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:208:32e::13) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|BN9PR12MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbc546f-9980-49ed-a863-08daffaaab6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2SYH+r5yKFcbzQQNiheAwdM4Rz+kRS9ftRCN/p73JK1/T0XSikxtz2htR7x9le3cD/6fhoE32H6dCOTpPti9qJebYjbJugLXde2aM+92ZpuKwe4Rd7Dn8D92qLfHz1TnLAFYBaHApjIzk+FEek8YzsI24gAOhL4Alm1DeCHXjX6UD4cI8dYivXDlPB4jnjwSvUxS+LnYJaeHmLfq4JTZsXz5CTZX+Z7vDai2xmlTTkFap5bxWtJwXdt5/xZ86Ugks5gdw2W+wSWp/omNrTp8lR5hRly5Mx1Smrwc1uT6ddJWNlPvdSg5zOG4HmC9M7ztEbrMu3YgswtLAzZpmeW5vsxcfTSwxO0/GwU7nAgdvpUcFutiQCUxHpsZvFfSbRuDCK+aPN+DyQf7DIkI/ipQPgu3zIEBtzcASFXLKgbMcuu2icuz4eJkfzSz4Y0EG7Kf30NQorYhnDMusJNkQwYXkg9NEIolbZxLwF7yA5Ke6B9EYo1PBP0ASWGRXDcYx0QgT0AT4MJ8LqM+YjXQI0wHSjMedPci0jhZvxoio3jC17S7keXhgabjauKUzbtSEgxyuIGUyXRU3AHz7OzpycdexzA2gECQZnmTYPoW/zceyskAKNqqdUtArycp4ng5OGO2J1TfnltuDYKBvOwTWUhdpqadBsOtGrX7CKcbgEkP7EwPDIFveYAW5uxv8/GNn2XVXUe9Xp+ztH8YnHreQ27f4ozJ5yIqfB+Zl6C1qoij9/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199018)(36756003)(31696002)(8676002)(478600001)(316002)(54906003)(53546011)(6506007)(6486002)(5660300002)(2906002)(4326008)(6916009)(66476007)(66556008)(8936002)(66946007)(41300700001)(38100700002)(26005)(83380400001)(6512007)(86362001)(186003)(2616005)(31686004)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFRCblhzS3lpNFphdEJIbWd1elpqSkRFa09YMDUzTVpGdnoxM1Q1QS8zbVNR?=
 =?utf-8?B?MmJmMndzK09CL0NvWW1Lb1FZZUFvQXQwdGNYQWtGcjZOUTBaYW9penMwcTk4?=
 =?utf-8?B?K0xrRXVjTS9GTVZGcFlzSytnQm1hUnF0L0dUb2M5T0VYbGFpK2J0ZWt0OVR2?=
 =?utf-8?B?VXRjNUtFNEhtcGhKT3FDbHBpUzhmaWYzcXJ0UnVWZ3NubmEvNVd3SkNrZy9P?=
 =?utf-8?B?UVp1bFNoMWdtQ0pocmJpaU5Da2NvVXh4ODlnMUtLb2pyWnNzdmY3bis4SGVp?=
 =?utf-8?B?VXFISjlVRE4vZktVY2pWb2R2L2I4VW84U2p4SkIxdmFkeGx1K1VrQUxMRk1n?=
 =?utf-8?B?OEUzZXYxYzJwUEtiTWRHVXVLQjROTitOQ050OUQ1M3EzeThyKzZrcENiMUhH?=
 =?utf-8?B?aVVZQVhEQ1EyNnNucjgrbVdxUUhQd29nN21NaUVGUmVWZHpNbEpDZ2cxdnJh?=
 =?utf-8?B?bTczelU2OVlVcU1tUmkyR0hGemp0c0FQd2dXL2VlK2t2WnlyTUZtbFBOUG9M?=
 =?utf-8?B?cWQrUDZvK2JOc2J4NHhsSmNqQzVRMjhOYXJKRGF1bzJDSDRtS2xENHIvRnV4?=
 =?utf-8?B?Z3FVUjJxc3RYMlE3dHZQMEJMWlFRVSszQ3BnVERGRHVRSlJRZTlTQzNKU1NR?=
 =?utf-8?B?bWZoVnFMeUdUTVlhZStOTGlybGp4SDBHdjk3MVBQQ3BEUkpCbEo4ZUJSOS9u?=
 =?utf-8?B?L2lSbjZKcHp2TzM2Vk4rSjJZRVByRzZlY3VNMDdmQzBva3hMTEdwMktuYmdl?=
 =?utf-8?B?TGdBNlI4bGd0VmtueFIyenF5YjZGQlpLTklZVWt6RHgzNTJTelBzSVlUeE51?=
 =?utf-8?B?aGNCRGtkMHQ3SWo4UGlwYUZnSEF6VWRsRTJ2R0RDbEhPb3ZmY1EyZFBVK1hH?=
 =?utf-8?B?VmZyOGRDdTUwNmRxcU5rczhMUkhVVXhhWFpBR0NCSlFvc21ob0QzcUFjOVda?=
 =?utf-8?B?NzRiQ1ZuSGFpS2ZGbE1KZ3RQSjhlVmVPcStMZ0gwaitUaVR5dzRSMkRwR2Fh?=
 =?utf-8?B?ZmE2OUpHcTFWeCttZkk5ckNYWi96ekRxRUVnYmxFMEdCV3hiWUZsSFZiMVNQ?=
 =?utf-8?B?NXR1YVdVM2IwZi9weEVlcUE2MDVuMFROSjAwNzVxNXlHTzBiTllaVWJjbE51?=
 =?utf-8?B?RVVDWGhOd0o0WmlCVjkrdXROQUhYbVNDTXhTZzVkRndkMVdpbHVZbkIzZlVZ?=
 =?utf-8?B?KzBuRWJFOVNiZHcvRWdMTG5hV0NrbHNrS2hqVlQ2bHVBamdzMGc2SmNTaE5z?=
 =?utf-8?B?bWRvNE5pMGZhL21HMHEwUHZZNVpiY2xLcDZUeWVzYzhGMk5OQzd2NnVqUkFP?=
 =?utf-8?B?NkoxQXhBbGhUQ3owRkczZjVxMTllR1ZMSVIya2Y4N0dzMHE4YkR2eFFoUFB5?=
 =?utf-8?B?dXY1cEV4YTJLLzREWXNNV1JlanJja3BaOHJRYVo3U2xOMWg0dzRRYUNxd3ZL?=
 =?utf-8?B?MVU5bmxVZFgzOTI2cFp0UXRaeHU5Wm1EM3NuMUxoUk5GRW9vZGsxRmkrczkr?=
 =?utf-8?B?ZHlraWVET3NRWFJiMlpVcWdFbmplSy9JZUw2WlhLRTBDYWNzaTRRazN5L0dw?=
 =?utf-8?B?N05ycnIxdC8wc3VMLzZXTG1nSWt5OURrMTl3bFk0ZHpFM0o2ak0zWU5vZjdF?=
 =?utf-8?B?ODBhTFJLeUJtKzdkblRkb3B1MytoUklLSmc1YlF5MTcycW9Mb3diSnBXcE5G?=
 =?utf-8?B?WDU2WHh2RUhwY0xPSGhiR0U0bm0yUHhCZnpZS3VZWXlnbWg2ZkpsNlpQNG9G?=
 =?utf-8?B?RjdXRXdDNlhqMk9qYjQzZ2ZLYUc4Tkkyb0ZLaVFwaW01T0hhZnJaVWZDY1Bm?=
 =?utf-8?B?WDE5Tm5HbHJlMVd6Z0d0Qk5XaDdBYnU0d0dpbGlKWUk4RkFuMHVSRVk0d2dF?=
 =?utf-8?B?cEFvRkdPRkRONFdHRzdxVnNlcEVZS0pOSjFxRmJvTVFCR1dNNlZBdk8vUk1o?=
 =?utf-8?B?OGF1WFAzMHdzY2NwRHl1MWl6Vk9RVlBzWXRJd1R0TW1vbW1BL1VxVlFKMEVK?=
 =?utf-8?B?NXlRRUpHMDArVlZVR2pLWEgydWF1ZlNhQVVNdEVJdDFKbUM1aDQrVjhQRysz?=
 =?utf-8?B?UTMvZFFXMWVzN2Evc1A3Qi9oMWlWMGRrQlJPVDVONHlwMytVaHF4bHNtQTN6?=
 =?utf-8?Q?874qwWTC3HblQxqT2NJllokJo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbc546f-9980-49ed-a863-08daffaaab6b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 14:36:11.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkWkj4ZvfQRJqFvHMiIIZss7PykrS0ddJDeAetqXiAIK0S0IjIyPSJIJ9T1VD/8lSbIA2dss6SU5H6ljy3JXfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5066

On 1/24/23 03:35, Jörg Rödel wrote:
> Hi,
> 
> On Tue, Jan 10, 2023 at 12:54:27PM -0600, Tom Lendacky wrote:
>> Attached is an updated draft version of the SVSM specification with added
>> support for an attestation protocol and a vTPM protocol as well as other
>> miscellaneous changes (all identified by change bar). Please take a look and
>> reply with any feedback you may have.
> 
> Thanks for putting this together, Tom! I think the review comments
> which have been posted cover a good amount of improvements, but I'd like
> to propose another addition:
> 
> It would be great if we have an equivalent to EBUSY in the return codes
> to the guest. Something like SVSM_ERR_BUSY or SVSM_ERR_AGAIN, which
> tells the guest that some resources needed to fulfill the request are
> currently in-use and that the guest should try again later.
> 
> The reasoning here is that in a setup with multiple VCPUs one CPU does a
> call to the SVSM which can take some time to complete (e.g. asking vTPM
> to generate an RSA key) and then another VCPU comes along with a second
> request to the vTPM. In that case the SVSM would have to busy-wait until
> the other request is finished. I think it would be better to return to
> the guest in this situation and try again later.
> 
> Thoughts?

That certainly reasonable to add. I'll add SVSM_ERR_BUSY to the spec along 
with a statement that says the implementation of any protocol function can 
return this result code and, similar to another comment, that the function 
must be able to describe the progress made or be idempotent.

Does anyone have any concerns over this?

Thanks,
Tom

> 
> Regards,
> 
