Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18B1BDC1
	for <linux-coco@lists.linux.dev>; Wed,  4 Oct 2023 17:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTbdrXlgpBVoIQ4ODUG2QNTgsMf0hxgnkU/SWnh8oSsNgAOgcAkbBh22qP4aCwstb0fbotbCxsb0J5/izqNpNUHvK7CugEmz0Bfq6jMu7zf9z6rDp+UbSW52SyjW8d0uAzX4YIIrLugdu5zVM6zTVeJhk9JhUzxeIcnfmK+aTM2dypWnOBLlpCORbKPpEccLNA+vD869ZAODiOCw3JyRoCz6OnSwl4OGHdsUsgnCaSc2Bo5ggKE9u9CoaEMSvEkWIsjCJzasNjcJeN9J2MmyKZa5dyHtBybeeP1twd1mSIGa2xXwUtfxhMpvP0G/upU1KuIKSypaaabW2Y9bqr+Ptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9LnU2jzzPHxOvI0xmQPaiRiv5E/8YypzNIe733oNF4=;
 b=K35eF8K8YyAlNWOC7pyWbBstBapVeBJIbhs9jwd8WouTEyIG6jONoykzPrCzRQ6rh3FPxWyI+xz/i8aT5ZkHd1ZXDKuZXxIvGRAYIKSnQtBvNiDB5mNL5UtagpVN+VW3GHZ88r61mhXvkS3O4LmW11U2k0O/0uIkEKvmCqvjyWSQea4qPijuecKW2zuOC8Fu6ML9UUWOUoJdrbvcg5hVg6lP75eS/Kug2YaPtU+UAhqPFnohP8lp1xJld+RZgD8mGJmfrdrAF1galy1faEifu7Cc079cNQLt1LwNgZ6EIB8atr+UoDb8UTq623qe7pwISKyFlXKADKJLvcULwZXb2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9LnU2jzzPHxOvI0xmQPaiRiv5E/8YypzNIe733oNF4=;
 b=5Vm3BiXrJnXYmgPnnaBp6OJW80gZ7Va6Aw0YzLPl575PqyJyE7uQxfot9KWUTlSVis8i/9jvzN5VquA+b9Nq0/RCUWRK6eCQXNak/O7pApAb4sXr9DMSM2oGalMea36RD+EaFqwH9b5IIq0EPeuTHOqwdd14OXSwW60C4Ofh1hc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 4 Oct
 2023 17:21:58 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::2b54:7ddf:9e2e:751c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::2b54:7ddf:9e2e:751c%3]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 17:21:58 +0000
Message-ID: <c677020f-5c98-ccdc-b204-bfaf5cde02e6@amd.com>
Date: Wed, 4 Oct 2023 12:21:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: SVSM v1.00 and GHCB v2.03 specifications available
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:5:bc::45) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 8219f2eb-7e5c-4137-435a-08dbc4fe6965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EnivUq/Vg4WnmsloUz1t+07ae/GIKXSw477oFaNtquwUCQi7uo+EnMpTbwhNTEvgjXAJl0f9BFL0afbRoNho4lzzhKF9d5ImpH8EJUPvILY6rML7ToOYSerOYKbPvaHd51Q10BbfRXtrvpw2FqR+raXQ7bk+h1ttZxR0lSqhNZYQipdp9QYFeyKphJCa7Mal4N2kSWPg8QEK+VgihoTN8NraTK+8+FfDttW8F/HtlNZFVnpoxNoi+uAfNcFyV1Wr7sqqs1XsMB3zzP6BCOF0+pFnRS+yA+nvgZs04FK6/+aGM76Bddpkd2RjHc3hGKPVRc/AL2xJrOK5SWBFesPYhaEq5QdzkHBnHY0PTfzv+7KtZgIXkoNdbsClXN6g/bMMU9mXbSmIkCy/MdMYH9+N6xQ1KsiEEJZW/SEoOOZGzoqwtyAQOP/y8uRIFPUKlTBcPyG5HTFi3TnlNPfRswjgtcfRqm26npMf4deP4hTB23PvoxM3Eu0P1uTu3ALtjVQ20sfCZwYtibhe5k/Kru2G20XQI9nQRyxFI/EY3ELzSB1kRRyY0xKxXMD5JGXInctOYags4w9R5lbOkpp34mvAz3glbzUc68rFW7jW/bq/gTcDsh7x/7rkA2saVQVzMaGVA0uetBLiUo8kDFh3wtCVpo86ohppUJEUPmG3q9rDXeqJCy1hWO/VsELxEPwmTSFW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(2906002)(4744005)(36756003)(5660300002)(31696002)(38100700002)(8936002)(316002)(26005)(8676002)(41300700001)(83380400001)(66556008)(86362001)(478600001)(966005)(2616005)(66476007)(6486002)(6512007)(6916009)(66946007)(6666004)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1ptU1prSmFBMm1sZlU1VEkwaFJBMjU3UElYMWxYekltTVVETnRPcXM2M0FO?=
 =?utf-8?B?QVRxcXhXRGltOW1VdUJCZDlnT1NZQ2tqelF1QUFYRlh3ZVRkS2lNRUgvbjRH?=
 =?utf-8?B?MnI0eVoxbGJ5MXo4MzZFelB2RjE0Z0xNV2RTNGRLWmg5T1hGeWNsSXoyU2pj?=
 =?utf-8?B?bmRqSU5wUnl2d2NtZVRaYTlDWHBSKzVOQTFTckoyQTNRL1VmU1VGcm8yZkxI?=
 =?utf-8?B?bUgwcHozZWpLOWF5dUtHSFZ2empna0t4WGRwdGhlakpTSlZUWnd3dGhybm1Z?=
 =?utf-8?B?c1l0dmtGSkNBTHRSVU9tb3Rja2pJOWtDa25KVkJDQ1VZNC9peGRUT0xJWkJ5?=
 =?utf-8?B?dXZ2NE5ndWwzZUZaeVRYOGJSMUpocGdsS1dkMFppbVZmSHIrTEtFaXFKN1Rs?=
 =?utf-8?B?ZGxlZVdJVDBHUi80a2E5S3Vac0pGS1hvNC9EZEdnaGZnQ01pYnN6Nyt6WkVJ?=
 =?utf-8?B?bGxCZTg2UUI3eHRvaFo3dng4R3U0a2laU3UvdTdrRmlqTjNVRjdyS0F6bU04?=
 =?utf-8?B?K3NuNlp1eml6UENGQVVxN0RWZEt4UUVrWVlRTElYdmJDYzBjaGhpRW1zZXNB?=
 =?utf-8?B?T3BsQmdiY2RvQnBVQTNlZHVSR1FuTUw2cTN1SC8wN3hPaUxUUVVIUDEvcXFm?=
 =?utf-8?B?eTZ2ZGhnWUcyVFFPMFRtWkEyWXVzUTY1ZkxaeHFwQ0VPWDF0STV2VnhJZUFO?=
 =?utf-8?B?Y3V4K2tqNW5MQ25lZ3l3eXFadTREMFpFY1lITUlxczVPMTROTFBsRlF4YW83?=
 =?utf-8?B?bmRaWEw2MkZyRHR1Q0RXUnNna2M3S2llTWJiOE8yMTNJUDZKMGZlSUlsUDNv?=
 =?utf-8?B?TEdGR2ExNFJKUlNtSEpTZ094SGVyMlJKL2FrVHloRU53blRKb1NCWXhIcjhY?=
 =?utf-8?B?N2gyeWpFdktCYWZndDhaYzBxT0trQThDMW84Y2czNlhSSHhRSmN3V3RuY0FB?=
 =?utf-8?B?cFBvM2s0K3ptL0llcnF1YnVSVlZRaEhOUjVPc3U1azBaYzNDYTd4NHZZSDR6?=
 =?utf-8?B?emRkNy9tSHR1RUM0c3UyRDZyMkE0ZXZKWVF5Ulo5R3JXdTd1emVWUlM0Tlox?=
 =?utf-8?B?bEhpN1pCNklwelBGQndXVnkwVjdkZEtucDFSS1dBblE1ZmpVOFRpMjh2MUt5?=
 =?utf-8?B?aDVxQ0IyaUswdEdqeGlUUm5XSkx0MUJncm9wK25RY0hMdXNYaHJlZEdjNUpX?=
 =?utf-8?B?RXBsMHZkcnFwVHFkSjhuOG5udjlldUJ2bGI3ZHJ0VzFYVk9kWGkzVndTRW4x?=
 =?utf-8?B?bXMxN296cVRpWDJ0YjNjUUtjbHNraVNoTTJBck1rYWFBYnFzMTgyNG1VaXhG?=
 =?utf-8?B?Ym96cHNyTUNJUEI4dlVjMjZIcVZqRWVJeStsZlorLzZndmY3dzJZaUxZQjR6?=
 =?utf-8?B?YWJkcTNZNVI2L3lneGhwTmp6bVUvbTliRGd5YUJ6ai8zVHkzR0lkaHB2eHFm?=
 =?utf-8?B?bGxWZnpSSVhlOVJDZFJ2ZnpSMVRyT3h3THJDNDg1U0NONFpUUzdIVnI4K1dm?=
 =?utf-8?B?V3djcFgzVlhVY3Z1Vnp5UVZPb0UvcnJaOE8vMnZSeTZuMlBPQys5dWtCSzho?=
 =?utf-8?B?UXZHL01rZ29ka2lmRExzdTNaelJ1UjhldldJL3VTTTZSZk1Yd3lmZy85WXoz?=
 =?utf-8?B?SnQxVE82UEdMaDQ4Nko4WEZrTG0xNm1vZmtXYVMyZnAxVXNmRkNPd2laNFlt?=
 =?utf-8?B?eDJHcm5yT1ozZXJ3UmtxdXd2cGtMWWdzUkNsdzhlajg3clUzNDlERnZUZGVr?=
 =?utf-8?B?STlHbkt6MVJIYUQzSnhQbjFMV1lHaWZISHhoVUt5aFV2YnNITHBDRmlaSHNz?=
 =?utf-8?B?VGFkd3J2aVBrbGNNblBOYmU1OTg3alVNYnY2TDFMU21JTkQvNm93bTl6M0Q5?=
 =?utf-8?B?UnNJbUlVS0ZUU2g2Y0JHUnFtNzZnYUVFRVhET21nMkpUbTdwK25RVXIwYXJN?=
 =?utf-8?B?Zkl0WDJGc2FMbmFIVlhVUjRkYW1Dajg4a1pvUEhVMUt5SGp5blFrRGQraEVm?=
 =?utf-8?B?djk4SUh5dmRLU0d3eDZzOXVQMURYRnZWWlZFOFRSVjlJZWQ0REdvUHAvdENk?=
 =?utf-8?B?S3hXZnhsR3oxUjFZS2J0bzkxZFhsMlJBb0ZrRjRQdGFYZ2F2bFl2djJnTEhO?=
 =?utf-8?Q?F8xbSNNgAMAEIsVQgwmCRepLa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8219f2eb-7e5c-4137-435a-08dbc4fe6965
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 17:21:57.9379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmVJxM4cZvdFKH6kWYK1rTzX5Stw6DemxfrgJ6qTU55BLzWkmnQJhZMCA3JyFsoDAhTfn7CUUC8y1ixG7Advcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673

The new versions of the subject specifications are now available. The
https://www.amd.com/sev webpage will be updated shortly with the new
links.

In the mean time...

The v1.00 SVSM specification is available here:

   https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf

the v2.03 GHCB specification that adds support needed for running an
SVSM is available here:

   https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56421.pdf

Thanks,
Tom
