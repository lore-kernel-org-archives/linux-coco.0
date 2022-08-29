Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577E633F5
	for <linux-coco@lists.linux.dev>; Mon, 29 Aug 2022 22:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiYHo1wDT3/zAPOBNSYMbgLyxy0YZBIKJYhzvRjERxa489pZRNv3/4mHssvTfruWIM6PH2RBW4wFKiZ6OhDdG1DyHZdzP5tef8BBi/KEICJm4oZZuL7Dtwo9JDyzoFBXqslEa3IEtdAocG1icY8I1l/YW586kPdkgyXyLbfePBgpsGtJEqiwRDQgYLibzMBGeUJTcYYIbSew9ML+0P/mQoD7XFittGgOt6Ce47+r+ySlpbntr7awnrukIc9OtiiMRjk1LIa2B12cfS04+gad4mM5c4PGfG+AAV10eDqCj6WeBBN/CiUnYbk+9x6W8aWDf6jK6iKveOM4S9qp72kCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqbbdN5jY9Ld8iZ7bPk0Msrcpv9HFRcj8Z7hWFEzc/o=;
 b=QznvyzREyI1ufoUUCH1UgP6hNztGcR8M36Zueo7yQWXB3LS67+1Se5HmWi3HgSXagUrSoKekBUYWaqUKiDJ5LRM8RUiYozGG8Ht+LzAh8gxbFfskuj7jp35fcFxIV2z+oRyVdMyLOJipyS6jaO0z08YH3YCL85qmHH6TG8Uu+mzQItQQGzzTRxK+K+715E/3uVqrIPVozGd1tqCY2T3ZqeznXFRv4+DcF4i+9cEUHCJw7eCDNCwxsWcj47i293jLKQ7M8DWoh4ZRWTksRQusdOgVSeyJSamLvkB/bi5tlGQHM67BXkY4igDiwVUQjJroInDM79fSYZ4uilzxWYLX9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqbbdN5jY9Ld8iZ7bPk0Msrcpv9HFRcj8Z7hWFEzc/o=;
 b=J2ZjuMjUe67fyrsfC/Tv24gV1CuHAV6R3fV61ov8r5p/8EbQOnqoMcPYxtY+sb8I+GGbpRUGUKeT3RFgIC3Rq8e6moERjsadaGwiiiDKNNe7yuWLewHFW0hRVdOqUsYXunvwnCVGX82FmbTMX1W2c7zelYHNSeTM9I4PhkuUrfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by BL3PR12MB6596.namprd12.prod.outlook.com (2603:10b6:208:38f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 22:34:36 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::e0b2:85b6:dddd:2e21]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::e0b2:85b6:dddd:2e21%6]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 22:34:36 +0000
Message-ID: <59442cb6-0869-5986-9c2b-e9d713eb7145@amd.com>
Date: Mon, 29 Aug 2022 17:34:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: linux-coco@lists.linux.dev
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
From: Carlos Bilbao <carlos.bilbao@amd.com>
Subject: x86/sev: Announcing Linux SVSM (Secure VM Service Module)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0347.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::22) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a132a54-dd23-4512-9f1c-08da8a0ea6eb
X-MS-TrafficTypeDiagnostic: BL3PR12MB6596:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zWd+nPSLmfRiF2O8St1dXKq8tp3WzxdtDXHILk9qRKvTVeWPSFUBFIAmoRrQM7umLqdqmz9GUxVCbHyCNZZ98gcLtHAGaXn3mWqLslkCYINCPZ0gNvjtCuJQfgfGkrYS/zrhbJxOukQGiHFyY3hE3St7D95MLHVtxCP/X+HyhvOc+edW2Jj4jh3oqPCmW4265dW+OTqZgkYdM77vVVe0ZDTFx4nCTMDlPFFBniFyTn3GB0Jvh5Rtj1OoO8K4+Xnxp+Xrbas4dbkZ3rz9invIxI1GHXG/tJQmmM1Dl0TcmzGil6COhVsaidt7nx2vIACNb7S/RHfNaPkd1Ei26fL9Bd5ZZ4ejSHCsG35fSywIBU5FJwqVEGeQHgGWRrVlRL250jsKpOGXTlEDXfCfmkbSY18smroHBx2/PaUq3NI0bxo0CyqrysYrgsynW1rJfHFpFtl16SZC9G3lAoYGw23EjkaNpS4IqAf+1iQgl2awcI6ScocIQtXkTSUeqJMVLOw6d6EipTynZhzWHEBbn93Cu+Nao5kKHHgELBG8QWK65XjYdCgfEV91ZAmmOPJHW7Q/1wWmAUN69bdbHRHeST7qwpyifluo1wKLngPUzSv0xcCiwaqQu7guxrT59DbBhZYsYAaaLIvybUrYQglVv7en+OUhR8QbcZWETOWgprqzuR0+mFOxdqbvfFm5pYakRfVXI11aSCouAyH5FM7snIUpfc/v5MnfoX+qLIE/UD7IMsZ0yPnx2sAxg4TOwqk29LEZnC88npid64B6IeeciTYrc2b3jwYXd7tPqgGNiXPaIlS6OqFsCSCKUyStzkImRHHZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(478600001)(86362001)(966005)(31696002)(66556008)(66476007)(66946007)(8676002)(4326008)(8936002)(41300700001)(6486002)(38100700002)(5660300002)(316002)(6916009)(31686004)(186003)(2616005)(26005)(6512007)(6506007)(2906002)(83380400001)(44832011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0ExZGp5ZDBuZytmay9ZcWp4a1Rib3RoQXhvZmZFVjVHKzF5VkhCbVJJa21F?=
 =?utf-8?B?TFNzSlNyWFUyZnMwTERPdGlkZzFRS0w1Q3E1SVNZbnlyOW4xbGZjY2syQmhJ?=
 =?utf-8?B?cmdESkRSUXJyU3BSekRnWDhDVzZGSGJ2YXpjVlg4OGlFNlNHc0FORXpTWFY4?=
 =?utf-8?B?ejV3a2EyUlFSQi9nRWRhZnUwbjdnai9sdDZ4UTNEcFVlYldsTGE5OEVuNDda?=
 =?utf-8?B?SnRkNm83ditVZEJkeDZoKzVLb0JxQUN4dGdwUURiTytySld5Q1ZrZ0lPNmhT?=
 =?utf-8?B?ZlJmeERLTERLQ0RjMTZoTHlxQVB4NjQzT0xud01HZDF5NFhRK3lGWkMwNHJM?=
 =?utf-8?B?RXliYmMvS0x6UzllK0JScm9KVWs1WnI4RTRYelYzaTlUTmg3MXI0QnlSVVZT?=
 =?utf-8?B?M0c2SC9Zd1VybXBzSnVWZjJ5Vnk0aHRwQ3pPb2F1b3pXYmN4bVkxV0MxeC9S?=
 =?utf-8?B?NHlpQjlBMmk3aDFuK29RUXN3QkRQRFBYQWtoaSt4WG5LZnByamVDOUllY3V4?=
 =?utf-8?B?d0Z4bkx3ME1XMlVML2hlKzRzS0I0aFQwRzNleXlYdGRsRmYza0R3cGpFM000?=
 =?utf-8?B?Rjl3YUNBNlc3Mzd5R0p5KzFuWGNMUWJCWmNXQ1lJRFFRMm4zYi95WStYYWE4?=
 =?utf-8?B?OVlaKy8wZ1o1S3dQS3J6aklaSnBTbmxndzFNZWFscUNLejVlTEw3OHA5TkFV?=
 =?utf-8?B?SUpYUTBiN0VMS1l3cWMvZTV6Y1VsZlpWMnJ4MUZUQ3BpT3BaajJHdjh3ajJP?=
 =?utf-8?B?SFR4dlNOa0VJSEFHVHRPc0ZXWmRRR3ZEeHBiOVVrVUYyQmljeVVMcyt5ZWhE?=
 =?utf-8?B?Qkl5ZlA3WTVyb0NGL0ZpV3JCRUIrWkV4QXlJT0V4Nm9vcHJUWDBBMWpoSlBL?=
 =?utf-8?B?ck00aGZ0YWV2ZTZoQjY5T2FkTTdQbjd5bUVKd3RPYWpZSTlEOVp5NS9vQjdI?=
 =?utf-8?B?VXZNbGt2UGphbXlvUE4reUczRTIvL2xYZEo0UmJibENydWhOMWZEU0RIdy9p?=
 =?utf-8?B?eTNpWnNUekF6aWVMWUpjNmphbllSUkplVnBBUURhRmdFcjl6WGxQSUZIRkEr?=
 =?utf-8?B?ZE5kTWxkTkRhcUxiTnZ4b3cxNnV2aHRhZUN3YnJXWGVZTmpiRTV0bkllaTNN?=
 =?utf-8?B?NWFKSlQ5cWgvZ3YwWHR3TmRmdXhJVTc5ZnFadHIzYklLN1BZLzdSbkg5c01s?=
 =?utf-8?B?dWRLa0wvY3JYVE90aWRLOUg4MTFRd0xiSUZLaU50cHNHMy96aUpEdmRKZFM1?=
 =?utf-8?B?d1BQbGswUVZldzRPcXFkUGt6d2tnaWo3RlhldWk4emEyeEdlTGJxTDI5dDg4?=
 =?utf-8?B?K1hNWVF5bWdUN2Q4aGVUL3c4aysrUi9mTVVJTGpiZjFLcndHUzVKUjBLMkVw?=
 =?utf-8?B?blU0NncwUFFUWWdJUjhlK3k2bTlTS2VkczhCSGxGaHBYUzg1aDhzcDdMRXgz?=
 =?utf-8?B?TmVrNzFFajVkL1poNnpla0VnVHBoNVdUTUJsTkQ0dnZSN09xVWRoeWttN0VC?=
 =?utf-8?B?QXVIVEdaanovaUZQbTEwL1NybFlsZEErKzk2OHlGb0NWOFhWZnZWOWh4NEl6?=
 =?utf-8?B?VEg1MElHNkYzYjd5YlJMcVA1QjdpRm12Rnd1dTIxOWN6ZkpubGgxVEUrbUts?=
 =?utf-8?B?R2JTTGJIbkRkR1kzd0d4a3NFbmJBcmxjejdvdVdjclVDK0RPT0NReWpteU9S?=
 =?utf-8?B?NUlrbkxNV2RMQkx0dTNZMFB5WFpVTkd2b0pYdFpCVjlSNEgwQmdtSk5VRXhF?=
 =?utf-8?B?QnRDU3IwSk03ZWFPYUhHdEJ5dHhGT2tPcjU3Q2pjeTZPU2YvclZ6UEpTcHlB?=
 =?utf-8?B?eHJhNy9tc0xOeUdxUGpDRUU1bmNXU3RJdWxaaTBKU2VSY3BnS2pKMXBhNmpN?=
 =?utf-8?B?dEJXLzNxSnJBcFRrVmNCSDdaekdieXFmOHhaODNNcTRmYmFUaUtXcURKeWxI?=
 =?utf-8?B?RHRWaTQzejlrT2VUSGw5bFZGUFdTVjNlYlFCcFV1UUZZUktrUnpEYUxqR1ls?=
 =?utf-8?B?Z1JNcEdDSWlIVmFHNUJHcGN4dkl1L0QzNWZWTGQxWXBUcE1JVloxQi9SenMr?=
 =?utf-8?B?VlE2b0NyS3J1cjgxV09LVSsvQURvdmpNUnNiaGtOT2tVVHNXWEE3cGhhckxt?=
 =?utf-8?Q?q2vCNjs9MPHrrLSC9YJ3bxb7S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a132a54-dd23-4512-9f1c-08da8a0ea6eb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 22:34:36.2231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKvFpDRbay5cWIsYfLAGyc9/ZbFJE9NYvJzWiwPf8s9Gf486Z2+MZEPFbJJBGfsbk/MgXlDG7qZaVAlyj5UFtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6596

Hello all,

We would like to announce the publication of our Rust open source project
Linux SVSM (Secure VM Service Module). Linux SVSM leverages AMD's SEV-SNP
technologies (hereafter referred to as just SNP).

SNP provides Virtual Machine Privilege Levels (VMPLs) for enhanced
security control. VMPL0 is the highest level of privilege. Linux SVSM boots
at VMPL 0, to then run guest BIOS/OVMF and Linux kernel at VMPL1. Certain
operations are only allowed to be performed at VMPL0 (e.g. use of the
PVALIDATE instruction and certain forms of RMPADJUST). The privilege
separation model of Linux SVSM will also be able to provide other services
such as live VM migration; and a virtual Trusted Platform Module (vTPM).

The link to the public repository is:

https://github.com/AMDESE/linux-svsm

It is our hope that the linux-coco mailing list will be used to answer
technical questions not covered by the available documentation.

Contributors to this open source project will be received with open arms!

Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
Tom Lendacky <thomas.lendacky@amd.com>

