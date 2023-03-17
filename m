Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EDA7475
	for <linux-coco@lists.linux.dev>; Fri, 17 Mar 2023 16:49:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XX7ZlI9YLdQn/rqByslqP2Afv7QSLYYvnSOAcXkyJyS0h10P3sVFDU7LBw/f+15Qbf7HRFiYZZd7g+5MHoIHocJh6Gtmv1y7p1r0Np/ywmtBcc65mW/GUlB6+5yslaQRgIw3OFzj9no2fFby2B9lUotPx/RX0wJrhrq+xCj+mXRUFpEn9+rIwz6+Klg7QA2uNk7ISPVq1S8Du8UpgGttblTU8v/cYIC4XdEB2/akSoPBUkKcicnM0/gttsYVhPekTH/A2HKnzPS081kC1NLq/d6SAXxwDgDeUreyLI64BEcuEgZuFQQFOnGPJFDKNwKK5fUN2v8PtuuO/fkCSTohyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIShSmvPcV1M7z0nTKpnyLjog79DVOwI0EjRmXTu3mk=;
 b=a+e8popxVnCJ0CmosocoYg8zuAxrFaOj+IcIreQeu9jdwN0raIoU/6d8jii7s9lqa/FmPvMpdVfBNdxC4YjaMU42d2460i1Y0NNsdS7aYzcHB3oWS7ANrsundQnJy7AvtKA/MiAzU6YN8EDZ2fTIi0sgAH6nZi6cALw7Y3bSsTSobsH/fQUtOhuroO3EJ+3bTpaDUoGzM/fpnAVOh+ihdwy67+fx4C6RqBp+A+xeTZiF/u5BsYxBoecbU+T0S+kRowLfGRSZiKojEXoySe0GizYw1lPW59zqgvkuizPawVjh26Swzc8k4opKTcbpibtdEVrAadMNC2zJ7XfHHUeY3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIShSmvPcV1M7z0nTKpnyLjog79DVOwI0EjRmXTu3mk=;
 b=2fK4SvffxBYlzOIhhIW1UWs9wLvi8sRF1iB8Nda0V+IMT/bmCzGJdkXSWYtsNCQD/rG6eiBlsqd680P8Xp/5RW9mubNoNdgGnbQd9iczS7VJEzFoQBSfya1MtNfJicPA05oNYB4D15bF+Kx6OrnELm3vj6o8SDIN4jAjkMqsVo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by CYYPR12MB8654.namprd12.prod.outlook.com (2603:10b6:930:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Fri, 17 Mar
 2023 16:49:14 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::5b56:bf13:70be:ea60]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::5b56:bf13:70be:ea60%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 16:49:14 +0000
Message-ID: <8391bd0a-9a3e-d572-234c-e43f4ba47d0c@amd.com>
Date: Fri, 17 Mar 2023 11:49:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: SVSM draft specification v0.62 / GHCB draft specification v2.03
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
To: Tom Dohrmann <erbse.13@gmx.de>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <a2f31400-9e1c-c12a-ad7f-ea0265a12068@amd.com>
 <ZBN8jz867HNLHVuj@notebook> <176f91b7-dc06-88f1-dc78-bf3f3d2dc638@amd.com>
In-Reply-To: <176f91b7-dc06-88f1-dc78-bf3f3d2dc638@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:806:120::27) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|CYYPR12MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: 752eb663-0911-493c-365c-08db27078a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sIQwl3tOrv0MabZvLbviejeXKqWIbDASfoGUIMZ4K4gym/hNGlHjS4pwhTFpFxRwyfMDIxfAA5GjGOL7Cheeg+7Bu4/X99bNed/GbgUJ0hDirMtFowK3FSka6XZae31Y7o5Zq6G/SFG+qP5XT+wJHG0dioswytIZE5h1kuijSwFk/tuc8QUa6YUKnln4JlnmfWtMnm0QcCmJ+PGyG+h6CmhajvIJqgT0wZthsy6SQkF/hF33lx6UMWRa3sXIAjkIhuE3NKvsobiAu5NflKRm6KlK6sYovtrnnBYgeBxjCF9t6LOG1rwXCccJVk1Tj3olKf6CpirwCl86BfFRftl+MCS38Go+NrOP3cjB7z5WOhYTRcyUVgQt2ZXWEnHxxkSSS0svnGqHJWzjtf1Yt9FqPqGKrOlLoMXhpe2UqLliVG3OvJFxbx1p4rf04ZXHUNb6+wZfztPWo0/BhbVdJ1m8sA6Y6XQQebVuTZoWG23/jej7k18WaWx5LupULgqfy5ru6RDR4sw1NjJjGY3Lx39UBNwRVh6oawT6voWMSHd3Pory+lf0fLB8coWuonclm/wuV8Niampufmkm66APKmF0XOPL7Pcfq1gc6ud1fRTOdCoUmJHd/lqo2OL8B96e/K/fL+rdv+fK//UTNrriSBTBVokvU0WRG8nJFRa5vxVglSmDUIdRNyA6sCvzba2EQa0Pk/t8iUGNYSYyurlE4e6QaK+djjBp3jGRTlmY1eDbit4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199018)(186003)(5660300002)(8676002)(66946007)(66556008)(66476007)(41300700001)(6486002)(54906003)(6916009)(478600001)(31696002)(8936002)(2906002)(86362001)(4326008)(316002)(38100700002)(6506007)(26005)(53546011)(36756003)(6512007)(2616005)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lvRHo0Vm04cllUL3huQ1Q0UHBuYlE5SVBEbGxDL1Q5YWlGMFdjTFZvZWIx?=
 =?utf-8?B?K3NsUHpXSGpac3BpWWRsaldEeFZvUldUd2l2eDVPWEVzdWljb0d2UUdSZHNG?=
 =?utf-8?B?MmVxRDVKVTBkeDBQVnFtcHVUc0t0RjhiLzBKRGpGUjNqNFYrdnB0L0ZFS2JK?=
 =?utf-8?B?OHp6MDdnZEdIOWJOYzRMS3MrQlA2WnJ0MHBkdE5IcUZhQ1hneVhUYUhLNkpP?=
 =?utf-8?B?UHcvSTNIWjJ4K3JwY1FKbWNZZkdzZ3NXbHdJcFp6OStxMkZFUE5BQ0ozc1VD?=
 =?utf-8?B?Z0tuMXpOU21pL0ZyS2p3V1NLUjdUSWhHLzN6NVJ1bm4rSWszZUNvWWs3ZVhW?=
 =?utf-8?B?eExEUjZPNWdVRlRHVXkrSm1yRDlnekxpUUY1Y2t4dmp6YUV4NS9JcUZXTFQ0?=
 =?utf-8?B?bEJFUXdweWpKYm0rOVN4UlY5RWZGemRpcDVPUVRad2kyVlQ2SExKQlNPZENw?=
 =?utf-8?B?N3ZqMnp4RjNRV3IxNEphMy9aaDhOUTR5eCt5MWJmMjNUcStHME9FVjAvZ0JN?=
 =?utf-8?B?dzNaUlRVdjRsWEY2Vm43elNreU1peWhLb2FFbXg3SEl5VWFGRlZLbFk2WlhN?=
 =?utf-8?B?MjBaZktzNEFCY2FldGNSeVg5a0RRU0hTV0kxMWhUS0pEQ1NMK21ubVl2S1Q4?=
 =?utf-8?B?c3JaZytjQ0U2Kzg0U3VVTFdqbG9halNyVE8wWWlFUXkrOEg2WU5FQk93Z2lR?=
 =?utf-8?B?WHlSMnNLNUxQdnMycERNY2FCVjFSbGhuMmw0bEhpTGxRd1JJVGV4Vy9xUCtn?=
 =?utf-8?B?MmVjNEZqVXFEK09vemNBNkxSM3RYVG5ZRUVHd1I1N1ZVRWVpaW56a3kwU044?=
 =?utf-8?B?WnJkM2Vzelg3Z1Q3TytKdXJwZEpsZDRaSURVM1JUUVBsRzhWSE5kQ2p0eHFm?=
 =?utf-8?B?UllIMGc4emF6QTZqU2xTNGVSeE9XYW84N0dPd3p1MXh3amZFWklZUkFQeFJq?=
 =?utf-8?B?TVkzVVV6THdVcXVOd3psQ1NIT2hiMXpxVkpZdXFHUDBKYndIcGxKRGwxUnNW?=
 =?utf-8?B?Mk9vUGQ5QkZWOU83M2NRMGpKVG5LN0d2VzRxZkZacWwwTnBmdjVqSkZ3NUtv?=
 =?utf-8?B?SURnM0djU1pTdUtCUnFocWRVeDRIRVExS3d6cWZkcEtOU0FsdlhFWGFCRDZD?=
 =?utf-8?B?RlVJci9uSG5ydFk5SklyQ09HRURUdjRJSDdUUWR1cUI4ZU5RRDRRWWd4Yk80?=
 =?utf-8?B?UXpYMDdKMTJybHI1N1hyS3k2bVZMeEw2TEdnZTlTSmJ3OHRKTzh0MlhGOE1S?=
 =?utf-8?B?ck42YUhHMmhjeUloU0EvcFlUK1pNdmNuZkJVeXFtQ1pwdC9SRW1VYXJBM1Ey?=
 =?utf-8?B?ZDJCT3I0MEt4Z3Q0amFkcUN4K3pjUjF5cjZ0b3BFYXB5NWlRaGtNeEh3UEtt?=
 =?utf-8?B?Q0VCNkIwWklTbHlCYmE3a0kxUVJlMGhLRFNRUEtvdStpaUZrazB0Q2hGcHZ3?=
 =?utf-8?B?di9renQzdzRWWHJzZXhoSk9UYUxjQWs1RHJ2em5acGZYMGxaTGVJR2xJb01V?=
 =?utf-8?B?akVFdG1lNDRLSU1ZZDhoN3BUd01sM1RIL2hWUUtmbFVUSmtvNE1NUmxzeVNR?=
 =?utf-8?B?ZDQzbmZNKzVlamp2KzM4WjI1NGM4MFBCd0ZJS29oWVB6dEl6MXdvekROZVAz?=
 =?utf-8?B?dDJzVmE5R0hFNzhLZnJNN1c3MFRkMmNXaGJ6UDY3RDFRZ2JScW9kZ3JJK05H?=
 =?utf-8?B?MGZ6ek1maXNIcFcwcEptamhyKzZ1endhN2RCMlo0bXIveUo3bk9OMTQ3S0NE?=
 =?utf-8?B?Rk1aZC9WRFpiRGh3a1YzK0MzYnlkbi9xRDlRWkcxM2s1QWxzcjUxNC9aZThC?=
 =?utf-8?B?aHczeitkazNEZUk5bEljVHRnQ2JUaURCemMycm5uMWozZnNxcWNMS00rRUlt?=
 =?utf-8?B?SUNCck9uMjlzNlExd0ExaWxrQzIxWW01RFRTRFRmaldJTG5sa0NhUWJsK2g0?=
 =?utf-8?B?UitSbHBLTUNuUVlwN1ZsczJCY1Y4NHBSeVZXbStzcy92MUhuQ0NXTVFZWm8z?=
 =?utf-8?B?SnBXL0xEcmhOWXdJZUhtZlpoamZkaGZoVTdQQzFJRU5lcW5JVityMFZYWDlj?=
 =?utf-8?B?ZW9VUXlBTmtqbi9jOVJhY0ZqV1ZXMGJPeTV4NVNzMHVURzEwSWcrT0FYMmV3?=
 =?utf-8?Q?WMVus+hLUVA05DreKDGTul1A0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752eb663-0911-493c-365c-08db27078a8c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:49:14.7473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qyc8UjyXc70kWv2rKuYm11HxqAvnREc9cjc+vrFncfqNo3eczFPsA2fFdokCvgTOZo4Oh2sCZebJC7gGyxW2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8654

On 3/16/23 16:12, Tom Lendacky wrote:
> On 3/16/23 15:31, Tom Dohrmann wrote:
>> On Tue, Mar 14, 2023 at 05:08:17PM -0500, Tom Lendacky wrote:
>>> Attached is an updated draft version of the SVSM specification with 
>>> feedback
>>> incorporated from the previous review.
>>>
>>> Also attached is a draft GHCB specification with updates for APIC ID
>>> retrieval and VMPL/VMSA level execution (and an SEV-ES enhancement to use
>>> the SNP Page State Change support for working with UPM).
>>
>> AFAICT the new GHCB spec explains how to run a vCPU at another VMPL,
>> but doesn't contain any information about how to registers a new VMSA
>> for a specific VMPL. From looking at some of the patches used for SVSM
>> it seems that a new field in the AP Creation NAE was added, but the
>> specification wasn't yet updated accordingly.
> 
> Ah, you are correct. I missed pulling that change into this version of the 
> document. Thanks for pointing that out.

And just as an FYI until the next draft, bit positions 16-19 of 
SW_EXITINFO1 on the AP Create NAE event will indicate the VMPL for which 
the VMSA is being created/deleted.

Thanks,
Tom

> 
> Thanks,
> Tom
> 
>>
>> Regards,
>> Tom
>>
>>> Please take a look and reply with any feedback you may have.
>>>
>>> Thanks,
>>> Tom
>>
>>
>>
