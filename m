Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183B7474
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 21:32:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWKnQUqfr7CEXwRkONJXyquNTFMtywpXNurbRqX3Lu3VYCZbJgNvvUKczL/Xm/N9xPgVreONCiN0cgGD0lWvFi7+455MACubT7uZ5L+Wm9C3HFzGR94Et0gW5OfXoOjoXaY3ja4WtH86BMBHDH42EXnxN3yhrfQuzwWk/QOpX+mk1p0jWtmh2Kvlqt3c498fxVqozRmJiuYOMRC7YBXVu9gyJzTkAY93Kdh+oZz/sBlV78Z6Wn3BFawdMCBfL+fekhulJ9aE/tvcTnD1Kk5BPq2opCoZIE1YDiQdG6hcUgrqocNl6xvHSnxU7UcNzpf3ed6947LLXS9vLaAYELnyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s//JcI9DfJcgzbzDBoWR2zKn4YiK4csFeQqcR+qgsHY=;
 b=JGbBGySn9LXg1iLt0GFeJJoGiZ8VHXif2xcBc/YCXyE1Ne8pPbK/0Q+wZcR9KKWmSssnWBeoqjze4KyTINSk7yqKv+TN8ha5OSJWnbwaZeBNgVnewcjCpy40YvA+qJ3MTCAVBRYTe9mYO6Bmg1wn4H1GIE1OGN00iiEpUsJKivTujpJRtn0KVPw0obVPoFMM/UoRK/KZCuWosDZAWXcvAiYsvvNUrtqOrXecls9FkCal/es8VB8LLgZnzmDNyMpbNGvGmPBcaH/gB2drERJJ4/FLsPZKzbZAlgSUz9xNKtOYcZfLTed7iiFLjHCSpvz2AX9TQUBM6Ow4X6iq7iNOlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s//JcI9DfJcgzbzDBoWR2zKn4YiK4csFeQqcR+qgsHY=;
 b=F15dh91c803Fpy44VeEzOD+tMu7OsOXg8iaCqWQ91aLDld3P7Rr43QZ2l0Dfd1l1P0E3s1ogLnVOYOVzcW/ZnyEaCKSK+Z0WC04rg1rF7g0yt3ZA5nW7/aIEAAJI8VE94rN9iWJuuU2/wTpcvXTj9FRcI+Lt4cMEJsM7JwWgZco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by PH7PR12MB7968.namprd12.prod.outlook.com (2603:10b6:510:272::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 21:32:36 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 21:32:36 +0000
Message-ID: <6303283f-cf1c-8be6-9359-69d556a89554@amd.com>
Date: Tue, 10 Jan 2023 15:32:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::31) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|PH7PR12MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eae35a2-b23e-4fb6-420b-08daf352311a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	umaQTbubALWtX1DqXPD/PyE5yj4KsBnrM8EBD1G28Rj+syp+NANvHhDFdiXJns0UCXlbrTtL7WXolaC967F8T8UO1advNzdjUvbqNIWU2hr4hGsuIJDzUQDfVLiAa75DHWGduaHNA93UoRA7MOu28+p9WuKlsoD5SzN4ORoOvh23sHlGOjwwrlM/LQXOZ2fk03QNaRRotl5Xer/BWGwPiI5bWAYmc0mqivkYc/VERxTlrxnuymnCaV1kiT18LzvgAkxC4cAwWDWTcAD4vpOa+TT8CeA0R5zdleePzm+LWEUGf+W6PeI0/YLU5SIzQFjAkk1r66c9Elaj+Glejb5tAD1f1nDC6s/uqVKNGk5L+ol5O/uevcnHA4VPBi8SM8ssR7TZxcheC01MwUnvkB/4Kn3H3wFAA/VTDg/42rMa/EpBuxtqZQkaiZq1fnwJn5r6g7qrlYocV4vl2t0SkAH/qPrGP32qzykiJj+xFzEuPcjPuDb2IyEX1ajR5hJJ9xiW87BPiUqSYr4ZDx5GNLSHZ2JCCjVCq6lAYMF9fhLJUhgQUIQpzO/t4UeKWaPy1GN8Jgh6lgNUvd42HuhwtCvDBz1D9wKi33eC/DbAb2UUuanombaB0jZ3MX+Sq+iLeWBbyz2drlEPe7CEI2lTT3w+1B8vHXvMPJ//DuE5VZo0SWwZhYaBZ3Ro400Y96hK3tUvjil44KnL3cC28MhD+xMW/YJXACd39BtEztwQIO8tSJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(8676002)(66476007)(66946007)(66556008)(316002)(110136005)(5660300002)(2906002)(8936002)(41300700001)(36756003)(31696002)(83380400001)(478600001)(53546011)(6506007)(6486002)(2616005)(38100700002)(6512007)(26005)(86362001)(186003)(31686004)(66899015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlpJYWhpZUZOL2dFdDU3MlNvVnM5cnhPRUpLcDZXTDBENW5WZmd4azh6azBk?=
 =?utf-8?B?L2xSVllsd1pvRHY3WWJycS9GVDJwNVp5YnAxQzYyU3pURUw3M2pvQ1BoZ2ZR?=
 =?utf-8?B?S0g2Zzh5ODBkNGh1ZDgraExLNTFKb2RHUm4wNlNEUHNhcE13ZEVoTVkyT2hP?=
 =?utf-8?B?dUdNQWNwNldMaUh1a24vRGpIRUlURWRBb3Mra1pGY24xdllUcHlUUmRGb3VU?=
 =?utf-8?B?dTdUWGpaVzF4Mm96akhwQU9xOVNRNktmSmZGbHdtckttZ3ZnZG9rclFGQ3g2?=
 =?utf-8?B?K1R1RFVNdUg4azcwMmxhT1I5K0x6SDUvNkUwOUw1Vzg3dHJyYVBJYnBMdnF2?=
 =?utf-8?B?cU4xZ25Xb04rcUk2TVZhT0ZNL0QvSzNpcVNSR3VDcTI4L2NRVExMR2JKTTZl?=
 =?utf-8?B?QU94T3h6bmJnQmxiMjM2U2RCVWRkM090TG5zZ3M5Mlo1dUFuYllyUDhodlVD?=
 =?utf-8?B?cFR0Y25YaTlKSk8xNitIenpqTC94QzdzQ2VJUWxVamdNZGFQb1d5SndHTThh?=
 =?utf-8?B?a3ZGVXEvTkJRNWVlTnhFa2dTWnd6dWZzWE5TSitrUmUvaGJEalVoRXltTENo?=
 =?utf-8?B?UTM0RnNoRlpoSThrMEk5eFBIN2JpSkw3aEhCOWxuVnZ0QzZITlVvQzNkaHRh?=
 =?utf-8?B?UlpzTUZTTEd2YnB0UHlSU0tvcUhaelpKT2kzQklLOGFuaEdINnJqV1l0U3ZD?=
 =?utf-8?B?aEUwMzV3VHZSblE2dHdUWDh0cFFaUGdjKzJLUmxxQlNuTjZUMEJ4d3VwenV3?=
 =?utf-8?B?eTJ3eVh5ODJESmRKRzVCZlFPK3ZhQklmWkVoMzJuTUtHMnhDckJwME5SRERo?=
 =?utf-8?B?K3dMbVA2VEs1OWJxUWs1dUJLdFZTL3FURlRFajhqTVF4aXd6ME0xT1RPREho?=
 =?utf-8?B?ejVCZXJsZ2kyTVVyRXBFRUpQRkNxMlNZRXYwSUZVTUszV1JyVC8za2VZZ1ZV?=
 =?utf-8?B?NnpZT1NCYXViZmRtTWF1OTFzWHRaUjA3RGNNQU1Fb0wvUlUwSFlIUjNyelI1?=
 =?utf-8?B?UHJQenhPR1lmQ2xYU1JsSHZYbUJlOExPMlJQUDVyTVpiWE1aYmNlTUJ3N2tM?=
 =?utf-8?B?bldGVGJsWCtRSlJOTXEwdXhOYXlPZnNQNS9GeDAyT2JWeklHUmJCQzR1akhD?=
 =?utf-8?B?WGJ1cmtTdU04TGZZY0M3YUdhUi9mcnVjSytWZ1BJWHZCMDVMcngwOHkzOVRl?=
 =?utf-8?B?dDJzL1FLTW1rYVF5WEpGRDBrQUxVY01jOVhySkZ2QmRrM0p4MXk3cklmZlhy?=
 =?utf-8?B?UG9GdWgxSE85dWFOUi9nK015cmpQYjRHMlV3TVVZUHo3ZEVSMjBGOElNWDNS?=
 =?utf-8?B?aUhJdDJjZkhOcU1rd0sxVk5VbVdra2pyNklyTGRGZzZIQ1N5VGdRd0Y0b001?=
 =?utf-8?B?ZHBBbjhha2krZEFJRzhxUDUxS08vYlZaakd3M0hBNm9nNkNPcC9ETmRwZEV3?=
 =?utf-8?B?b2FlaGRMVy8yYmJ5ZG94Q1NwSTJxdHJkNG5Hb01ydUdCbWNvQWxQV3V2azFS?=
 =?utf-8?B?bkNnZ3dXcjVGZ29aSTAzaEtjR1J2MGVIVjgyZXJJdDJNTGJCeWFVSWJDTUtN?=
 =?utf-8?B?bGdzL3czdGcxL1dPQjhON2JaUGtWN0FBMXBuUG1meUp5NlU5a1ZDWU5WWmxr?=
 =?utf-8?B?R01vZGJCU0xYZTh5U0dpeE51ZTVtTTRrbjFkNEYyKzhJSmVyUFR4aWcrMjJK?=
 =?utf-8?B?OWdtTFM1dnFoQXk2aGlqelQ5OURjTmVRSnpPZTVEM2c4YjNLbmtiOEcwSUZu?=
 =?utf-8?B?TVB3WWhGRnp0TWtVb0wzajg1UWY0cDRGTTJqSHNwV1h5NXppdjB3TklUK20r?=
 =?utf-8?B?dkd0Q2VqQzlmV0FMeFc4UlR2RUdReTdXY3U3ZWlzcldkT3lLQncyemhlZk1H?=
 =?utf-8?B?SVducWNSL2U1dDBuVjBIanFJZFV3bTliL2JYaXBRNUJKMFIva2dkR2RtMVY2?=
 =?utf-8?B?ZGkwYm85b1N2azQ3WUpnQ09DOXVXazZNREI0ZkVabU9zM3RSZ0lSYXVLVWtB?=
 =?utf-8?B?cHR3WkhQelFqSVBiUVlUUG1CZC9MUE5XN0Rlb3RxMERBNmRQZThoRnRwZStX?=
 =?utf-8?B?anpsd2V1TnVGQ3FVSTZPVi9rNkcyR2dnaHNNOVRXRlFzSmxlajB6c1M4RWE5?=
 =?utf-8?Q?8Xcq40HRtJ2tAfPVIYVXafy+u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eae35a2-b23e-4fb6-420b-08daf352311a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 21:32:36.4425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4JvtQHnwvIidSHpurr15jb0VN7Q+7st9Rgku/rQfqrt1xqf08mJwf2+wki1Lpg7//Hgor3D4t8qVsYtq2uIXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7968

On 1/10/23 14:29, James Bottomley wrote:
> On Tue, 2023-01-10 at 12:54 -0600, Tom Lendacky wrote:
>> Attached is an updated draft version of the SVSM specification with
>> added support for an attestation protocol and a vTPM protocol as well
>> as other  miscellaneous changes (all identified by change bar).
>> Please take a look and reply with any feedback you may have.
> 
> 
> I think the first feedback I'd have is that the word "ordinal" isn't
> used anywhere in the MS reference implementation.  It confusingly
> refers to them as "commands".  To avoid confusion, most TSS
> implementations call them "platform commands" to distinguish them from
> actual TPM commands.

I'll change over to using platform command instead of ordinal.

> 
> Then in section 7 "Attestation Protocol", the way we've currently coded
> keylime is to validate the specific TPM attestation.  It is possible to
> code it to extract that from a bundle of attestations, but that bundle
> size grows with every new service and the verification is remote.  It
> would be ideal to be able to request only a single service attestation,
> so we can keep the current VTPM only attestation in keylime.  You seem
> to be identifying services by protocol number so perhaps we could use
> the protocol number instead of the GUID and also have a call per
> service protocol to attest only that service, say as function id 1 of
> protocol 1 taking the protocol number and report version (starting at
> zero)?

Yes, it would be easy enough to create a single service attestation 
request call. Using the protocol ID would be simple, but do we envision 
any service that may be running in the SVSM that doesn't necessarily have 
a calling protocol? In that case we wouldn't be able to individually 
attest it. I'm not sure there is a case for that - maybe a live migration 
service? I think GUID works well in this case.

I'm assuming report version is to always be able to retrieve a specific 
version/format of a report. I can include that in the service specific 
attestation call. If the version isn't supported, then return 
SVSM_ERR_INVALID_PARAMETER.

I'm also assuming you have an idea of what you would like that report 
version to look like.

My thoughts were to again use GUIDs to identify the key and key-type 
present, i.e. EK RSA-2048 or EK EC (NIST-P256), etc:

	16-byte data GUID (e.g. EK EC (NIST-P256))
	4-byte data length
	data

	16-byte data GUID (e.g. SRK EC (NIST-P256))
	4-byte data length
	data

> 
> You suggested that because REPORT_DATA is 64 bytes that we should do
> the sha512 hash of (nonce || data), which is how the current VTPM is
> coded ... is there a reason to go back to sha256 like the new document
> proposes?

I think I originally suggested sha256 and Dov suggested sha512. We didn't 
really say definitively which one to use. I'm ok going with sha512.

Thanks for the feedback.

Tom

> 
> James
> 
