Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828F8BA2E
	for <linux-coco@lists.linux.dev>; Wed,  4 Jan 2023 22:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxPCUFssgx6h7mBNuifO/ofYjIhl2mlSLsqO0t85jVbZXYPgF9Eba5c4EF77+MngiYBWaiF8noee7cfqgIdhtsIyUbGwMNnlCdNUFrKAFHByvOsdgbgg+sOI59pMduFfwjOvRh6+0gj8G/Wmd0B5JJEU+dfDIVxkvCPfqj3cXSR4opnvf30PmqjGinJOzQOrs11ZsjRRhaBO7oDungLGjLcRJGNaH43HY3L4K5InTtIszExvgZdzJWacmp+hvzsqS2LBvPEhXfAX2uY2HP54AdL5ccCrhG8YnbomD+rfR0oLfJJ4+Ceadx5JWP6nMdm4IbwmmOpDuCerv4D0JaaVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkIDK5KCrTiqJAJ0mCOWcAXxijeKlLBDv5tQtNBl6pc=;
 b=enRYqBnsfOoEwF03AnqMTU5QSmmw5qmICGUqiVkI2eY+0HVZ1ElhHepOgBZGVDcEPl2/7V1DgWtktrFa4sKq94OgW12gFVudfV5hL7gLJlZeK12TxEE9qEr+cMyBAJePnViYv6pMsDehxPEAw8qoiJ3vZDK/PwFfyl7yd1BbEWjTU3gCl5dkHVFsa4bbJmOXLPQrRYyFJPyUdjTp8e7Lbaq6HCu53edeHVEiqD5y0Jd/8kIc8up5vmlWJpxbgkQ4baG15IQROhIMIOff0K4MQOdwnnLBXKuLm0Is9OOfk6i083GjdBmHeKqh0ofvOfh0Vj4UcGe9V4efBpMOHG/l7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkIDK5KCrTiqJAJ0mCOWcAXxijeKlLBDv5tQtNBl6pc=;
 b=Os3nt4jnIcHwoM0c+AxLnAcWLkGt80+iBT0WOKQOnbY4wpnQnaB1x3WLV4d6i2MDlMA8UlDUAb+6qhN4mkpQm4mlRSDoT+GEEU88hWZzcNZYeaWfgPz27m2ZT0EeFCxyzaUdTmX1RsmvqGKNVlSOEGKtFy2GcR4xvfnBQr6HNPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 22:44:43 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%3]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 22:44:43 +0000
Message-ID: <93bb47b9-4381-469b-b02e-6e494d0c189c@amd.com>
Date: Wed, 4 Jan 2023 16:44:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 0/3] Enlightened vTPM support for SVSM on SEV-SNP
Content-Language: en-US
To: jejb@linux.ibm.com, linux-coco@lists.linux.dev
References: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:91::28) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f01cd2-9063-4102-e8ae-08daeea545b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gRMSfQ01+abLgHSqus5x9wHBuAyFaw0VxNijhbe/0taw0w+V8dm2C8A6c5uPv9S4vzlSVWppt2voiJyXFP4DiQTKlOAGflXalXGJ+nEcukM4OPVk35PjsmBLuPc/ZDGdedw7W2zpc1LhPRbqobZAjN++G3UaHV2xuBr1d0J0/m6ZNkTxU32jUpLkDKaKwlxSV073QJQfUpTocWLtE4g0KCrwNgoOHKhbdzoF4X6MXLq8rny6hgR6g9vFT3IYWZRQylpdZkR2G+E/55XEybjRDw57hcpTaVKXXMVGiZs1nAffUPlL/do9EVInBxZMg5NLf+ea1vqWqT93BJAdRINHiLIQsFr0yYc4SHzEpVtpm/Z0jQwK5XgMlnujIUEvhZiS1J9wv13HTNSzSdkDMs7hg6kJJ1JDmKnRDz7GQmcHaltfcyNLoevrx07Wl80Ni6qiP+HishZXVmCNbloe/JDe1S/0GOPR6X/VgvncYSe2+3+JZayDakz5ung55NUnxcgudOAA/56g2cjK6n0D04mAYu7dyo3nvDrpRTkf5QW06DbUbyzOo92yloMegOccmxNxPTX88ZbCN1Il7hI37FGd262JXdCILV39/Ly284gbmpCkCw2eedFtjkHjxbx+1YQbsm69ftP1fvES6JoVTcV0A4aodKrRk/kse8Wc8mdYXUb7oodncrNHMPBSepkG5Fr4Pu1PS50y1BPB4Fdoja5YOhhWwoDyKJwDzYbs30cYqPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(2616005)(83380400001)(6512007)(26005)(186003)(86362001)(31696002)(36756003)(38100700002)(41300700001)(2906002)(316002)(8936002)(66476007)(66556008)(8676002)(66946007)(31686004)(5660300002)(53546011)(6506007)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N05vR1NmQWVINzl4MWdRZlBHVzdEclA4S2ZNVk9EVmxtT3JGVWhmRVRqeU9v?=
 =?utf-8?B?RGpoRXRoY25pUlU1VXQzcm1PN0V4R3FqbXhTZno3TW1xaW13ZlRraXdjU1l3?=
 =?utf-8?B?V1ZibVdDNDBiank3UTFKemhiVVBQRVk1QnUwZHFvYlMrbXlxWkdmc0EzUnlI?=
 =?utf-8?B?ZlRkcFNFcWRzYXptVlEvWU4ySHAxbmhSVHZuc0JLSWZ2dWUrVVVMKzcxWDY4?=
 =?utf-8?B?bUNOOTljc1hVbDdSUzU1TjFrcHFFMkNYR1VUNGRTd28rQjI5b0lweTNRc0p6?=
 =?utf-8?B?VnJIZE5kaU1CeHB0dmlReFA2eWdaclNVWXNhbUhRQW90aGJwRXVvc3lZakE3?=
 =?utf-8?B?dSt0bXZzUng4RE1ib0M3dE1KQUh3UFU0MTBJTEFiaXBTSEh5UWdsUkJyUTJ0?=
 =?utf-8?B?aXBwamJWMWo4R2tmNGJBWWhqZWlNWVF5ZGJZUGxHUCt6ODF4dlY1MTgrZGNu?=
 =?utf-8?B?a3grZW9BZHR6YkNaMjFkbEJDcC9oN3ZkR01zc3pSUFo3TkI2YnFYWW5HdEE2?=
 =?utf-8?B?WUdWNnozSGY2aThTMERaNUZpKzk2VEN2d0hVc1R0WUJxV3JVL3B4dG9YU0p1?=
 =?utf-8?B?LzhLMXNURXlGSmR6LytUWDZ0UndyM2pXNUZWbzNIeGZLeGRTYXNLWVVYN0Ja?=
 =?utf-8?B?UkNnUWZ4aENjUFluSGNVNmVHZi9zWHowNWFWK0lFTHh2eHNwREM3ZGZ5UEpv?=
 =?utf-8?B?UEhSTmxhQzBOSG42dUVNdGdNaDJ2SW9USUR6VTZsMG5UK1dwMDlqTnRXUnJ6?=
 =?utf-8?B?TE9mRnY0bHZQYTVPcDZqNmJyeTcxWjh2U0cydWdlWnYzM0hHTTVlOU5jcEdC?=
 =?utf-8?B?Mk53TU1YdjBxVEZuSi9hSU8xOGxwL3pQblJMVTlybHQyZ2pUMjRWSlhyS2NY?=
 =?utf-8?B?ZlhBMjdsUkgzOUJGbjVwVEhycTJMRUEyRlZ6L0laUTZHeHEvekg2c0M4NzRx?=
 =?utf-8?B?T1pyaXB6NTZxYjU3UXNkL091R09Oa2V6S0cwcHBSM3Z2MGk0RExoU2NzcDJu?=
 =?utf-8?B?ZnNJRmxBVk1teTFMay9Cc0xrOVVudlkzZ1hVbnArYllhTWhkcC9xZlhZcHg0?=
 =?utf-8?B?c1Q2QVlhWThCVm0yb0VFQ2kyYmFsZng5aGtiL0pWcXBGR2lFZkloNUhER1lx?=
 =?utf-8?B?Q0pkOEtzZHFZdE9UWUNWZlNYVFBFaVJzVktYc3BSK2hPNklzM1Y4bkR4WjVs?=
 =?utf-8?B?bWsza1NKc29ZVDdvK21sdStwMC93NFJGZy92NXFvcTcrNUlkM0xRUFZsY21x?=
 =?utf-8?B?NysvbnFReTU2V1NKdGhCQmtQSTI5M1FFOGJaUU9pK1dvamV1d2pxTW5sMTIw?=
 =?utf-8?B?eHRxVUtKUmFoTTE5eEdCaTZXazJFSUY1S0ljQWw3U1J3MERCWkkzdXRBQmlR?=
 =?utf-8?B?ZHV3SjF3NmJVQzhIS0s0YUFHc05xVEYwZDhIYWNYNFl1STY5UUZPK2J4aU5x?=
 =?utf-8?B?UjhCY1kwbkE5Sy8rSDA4T2oxWHJ0eVIxY0M2VWV5SkY0K21BMTFXcEN3SGJh?=
 =?utf-8?B?bWFwblo2WEdIOVBHL2xGRHkxMWttelRIL2ovT0FrWkgwdzNCM25ZTHZTTnBE?=
 =?utf-8?B?TE1ReE5vblFZMHI5Q05yQXU2WXBoNEQ0RjdsUmVMQU51bGxTTkRDckVieFhI?=
 =?utf-8?B?dmt0YlNmYzNYdk1NYkVDU1REeVdOeUpjaFRONDBOb2V2VzBub1E5K0o3M2ZT?=
 =?utf-8?B?ZFBkdjNxZlZMUVlzYVU3azNHSkNFSk8yYWRHaXhwNWV5bjZVdXp4ckhLMkds?=
 =?utf-8?B?dEhmeTQxSlVrdHhzQXFTME1WMnF1aEcwcm5DSWc1eHJia2dBZjY3bTFVMDlD?=
 =?utf-8?B?a252a1dlaXN3bWNhSnhUV09KRDdtQWVDblhSRmt1N3dQTStzRFNDQ3B4UzNT?=
 =?utf-8?B?OU9pdTlEYWlic2N2UVA5WFRCbGtyZHlQYWM0dXJOa1JwVTliek5Zall3cDJI?=
 =?utf-8?B?VnQ0dE8wNzZQN21oNWEwalRDaFFJMjhEQW85bHZoVEFkLzUwd0RyUG5Zcm9t?=
 =?utf-8?B?YWlQcTZXODNKank0YjlKOXA2VjNHU1NIM1RGb2E5NjhDMis1d0dKcWszQlZF?=
 =?utf-8?B?MXo2TEl2NzBaQzk3SmQzbGNjZm1YVXduZXZrNFNSNm1raUhjRUFGYU44OXMw?=
 =?utf-8?Q?FkcN0yIMWA1OHZ20Qp25kBcXK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f01cd2-9063-4102-e8ae-08daeea545b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 22:44:43.5238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XXbHtn+OtneSfGBxOyCv7j3gHy7NK08k18lHixcPr5rnURNWgY1BfKx3UYnjcFkVDpphKbqDsiZSVMLtnh+Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501

On 1/3/23 15:01, James Bottomley wrote:
> This is a sketch for how a fully enlightened vTPM driver would work.
> The idea is that the SVSM responds on function 8 to vTPM requests, so
> we use that to send down a buffer which is modified on return (the
> buffer must be big enough, so the agreed protocol is it should be a
> page in length, which is larger than any possible TPM command or
> response).  The protocol used is the MSSIM one which is self describing
> in terms of length, so there's no need to transmit sizes (it also
> leaves room for expansion to localities and cancellation, which is
> useful in the light of discussions).  A NULL in place of the buffer is
> a probe and the SVSM call simply returns SVSM_SUCCESS without doing
> anything.  This can be used to probe for vTPM support because any other
> return would indicate no vTPM present.

As I write the vTPM section of the SVSM specification, I am making it a 
separate protocol number (2), not part of the core protocol. You can use 
the core protocol Query Protocol call to determine the presence of the 
vTPM protocol instead of sending a NULL buffer.

Hopefully I'll have something out very soon. I'll gear it towards the 
driver implementation that you are proposing.

How should we indicate when cancellation or locality support is available? 
Should there just be a protocol call ID that returns a bitmap of supported 
command values (e.g.: bit 8 would be set for TPM_SEND_COMMAND) and a 
bitmap of supported features?

Thanks,
Tom

> 
> Hopefully IBM will publish the new svsm-vtpm repo shortly, but we're
> still working with the old CRB based one at the moment, so it may take
> some time.
> 
> The three following patches are for two different repos.  Patch 1 will
> apply to any upstream Linux kernel, Patch 2 requires the non-upstream
> sev-snp repo and patch 3 is against the non upstream sev-snp edk repo.
> 
> James
> 
> 
