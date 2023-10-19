Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F644666B
	for <linux-coco@lists.linux.dev>; Thu, 19 Oct 2023 05:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TXaN0LvX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9VTc62xrKdUm+dZH2YkhitMdjWswWJrszCd/AKXxaLFzKSylwucU9biI7skFjZLQK65U01OVlkNmPRjBsKOyIQXvh5xJ/j6oeWHoOv31uL6TmQXYaZoT/2VKtRL6u8YfGRsaI5waW47oL/kdfpOkYXRtUbTbb3QdNRpLy/ekBR5MjedHBonxvX7yFkGz0gUhDU0+5uqjnaNVhRGKMFpO75wcq3A72fcndcq0bYShDekJGhhr/6ZaPbKECsfUOqEL6k/U6f9M8dns+XfDJR5MQZHO8RK1yPt3K1m9nyvMpNLrdksrXN/O2avcK8qoA0/CGvtmX2hFtMxpx3QxleRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bcO2ohbK1LpBHpX+5zcl8nsw9wM99htWxQR8FG6jMQ=;
 b=ippCeoIvUd9Y7RA54KRdXXGyt1fWJ7Fam/mPzvOSUWEvxEzPjdIpS87mflC9EsIEp0iNprGhqAsHrREmdjhX7oLfAlUcDLhvGJEPR1JBv2aOq52JiThzXrZIFDJUebJiSW4ADWmGSmfPV7vZNuSLv+Sf3pVGMX690FdIz9fvABcxAt9GpKj8mtxmfZm0k61cDyuyemAhhUsj3vhod641ul6IbT17mhxpmaaYVSJ901xsJ+n81viI5BJQlUM2cTKhl6LLsRcuRVsyovnw/2G3nLDWwT0jMBJ3nXkWzW9BHlOmWdODJCnqlvtbgulLkhtSjud8klCO1lm+1rRmuZW44g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bcO2ohbK1LpBHpX+5zcl8nsw9wM99htWxQR8FG6jMQ=;
 b=TXaN0LvXMwTmb4OYmPlnUdrI7oRfiVtvqUsDG9HXLOEMZeLEwHicyhiSXioUVWxaSLoo7ycRAKR3bLxMeItKRHtLse68bDyq+pOluvOqFqyf2OmX7qWXENi0SxxTHFOBXLeuNoL14HHI4CWYA4LWArt8Uh6SxLP1WUpEmukuWkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by DM6PR12MB4249.namprd12.prod.outlook.com (2603:10b6:5:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 19 Oct
 2023 05:12:51 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a%3]) with mapi id 15.20.6863.043; Thu, 19 Oct 2023
 05:12:51 +0000
Message-ID: <e83612b5-35ed-427d-9d2c-f502a9c7e4c2@amd.com>
Date: Thu, 19 Oct 2023 16:12:35 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh
 <brijesh.singh@amd.com>, Jeremi Piotrowski
 <jpiotrowski@linux.microsoft.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 peterz@infradead.org, dave.hansen@linux.intel.com
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
 <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
 <652e086f8de7_f879294b0@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <d52fedac-c1a1-43e4-abce-f6bca273f352@amd.com>
 <6530b3fda1e2d_5c0d29451@dwillia2-mobl3.amr.corp.intel.com.notmuch>
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <6530b3fda1e2d_5c0d29451@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY6PR01CA0110.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::15) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|DM6PR12MB4249:EE_
X-MS-Office365-Filtering-Correlation-Id: 5392a029-c3c9-455b-e14c-08dbd0620a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3h4bv38cnI0mts5mjxxPukxKJAROfSVGsdSDkA/J58XPc1FJfubQBSgy3XJ/lLbKsbLKLjJ24NOK4pCSFKd9EBsBs3rYFJjpr8c+DzX49t9/xrH5HwWF6Q5JijW/Nr6sP/DTQH2Fj2FHjBRDcMNpWAnvfS6/WR0c+X+YuIQuoDptTdzKy9eewTXyCDD5DjqOKPloJhD2dXgVvVU4o+SZH4B8M8k7AdG4ZkGAjyYMFESt9eR5TF5wLZ6M7AQTmYhegjVU0P4CgZ8XAS7DVyesN7K/2c4f8zvtK95bxJawGTiAeaZTl31Ic1KpbFVo63KGGxpab74YZR69xHwnv8WnOEX4rIt6q8MhCZ4/B2Q9f3DTK3N6jlRgY8itoRWETcLxqDcDdGHcAtmBEO0lnL4eIwXJ7oKZCRdh34IeGnTFofULLatWH+AfEV9V2KZdnLHPI7InoRqB9mpBSWj0vdkkWtiX/dCEAUMzQRkv5HAtPfrEIipXSkcDb8UQyK1MZwMaFWwkJomosDwi7umZtvswjpoqMvsv0U4bEt+z6W65Ro35yKNjKTr3qBrhrmUJITiYDLV/AHIkBTf6HVycTFM0Lpy2eprWpZ3KfttWRoFvbsIaEy4hqJ1htwpA7VYYRYux2N8GJxobTQrxafj/1u2itF9bnwVIBNBeycmq2oYxVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(54906003)(66476007)(8676002)(66946007)(31696002)(66556008)(2906002)(41300700001)(5660300002)(4326008)(8936002)(316002)(36756003)(6512007)(83380400001)(6486002)(478600001)(6666004)(53546011)(38100700002)(6506007)(2616005)(26005)(31686004)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEErUzRSenR2UnduSzJBbU5vQlJpaGl0K0EvSVY0eHppKzJJenBJZlhQSjNw?=
 =?utf-8?B?cmVFVkphUmx1bEROZjRsc0YwTDA0Q2RZTUxVUGdOd2wyQldGUW9sSE5SeVhH?=
 =?utf-8?B?VUM3Z3BMMnJSWjN2WUpyUlFzYXM3aThqbUJNamVETkhodEFYbHNxeHB3c0h2?=
 =?utf-8?B?WDdvUzV3N2ZodjU0bktCcFVDZHc1elVzTTFyQkEweGlDQm9nb3JBbXlnampx?=
 =?utf-8?B?Y1VlenBiWG9JekxhZjNtQXFFTmJJOXMvSDJZV2QwTEZwc21VK3JXUk5EbkFs?=
 =?utf-8?B?aFZCSFE3MThSZnMzUlRHV2RDQnI3WW93Z3drOGcvZHZ6N01EK3hjbmFyVis4?=
 =?utf-8?B?MGVrNnpaT0E3U2dtR2RTWDNQcndwdlF3SVdzb0hwclA5QzAva0pDMnBSbnRv?=
 =?utf-8?B?dnhwTjFGQmZ2QnBJMWZRQkEydFRSa0ZrWlJ6Z3JHYktDZW1HQmpYTHNMSytj?=
 =?utf-8?B?OU1BM2dvSFB5dFZFS3Z4RmZpL25NSjFoeUUyZFMxVm4wOGJidzh3bHdQYkdO?=
 =?utf-8?B?QyttNXRrN2FSNGw3bmxFWmtDTHdWaGNDaE90MzRrdFczcjhXUnd4M21NTHBC?=
 =?utf-8?B?UzB6V1B1OHMwdHJMRE8veGRiaGNyaUNDVlJVa3gyYzZTNFd5dUlOOGNlUEV6?=
 =?utf-8?B?dmxjQXJ2amZLdWphL3VkeEQzS0t4RCtYTnpJUC9VZ1MzSmJZY3NxMlpmZHRm?=
 =?utf-8?B?U1htYlhVRXBVZzBDQkdMTXdabzRlVXpBMHFKbjFJOWFDRlFZMXBJYVZsSnB5?=
 =?utf-8?B?VmVCazlyd2x1SHY4R2gwNDNGMitHN0UvMGhPcVY0dWpzZFNHemIvZHpDM1dp?=
 =?utf-8?B?VEZaa2REbVh4VTVpd1BvS2tZNjhGYkVhOHlDU3FnVHgva0dwS3VJaGR1bHU5?=
 =?utf-8?B?ODBBdGgzcUZjbXYrN2NQSlFrbmtCTU1tV2FPZENKZDZKeVE2ZjVRSm5jQ3Zv?=
 =?utf-8?B?b2Z1dFpmM0NBbCtZbVdGUTJ5NW0xd0tPS0JsU2p0SjlNK1RnK3JYMFhTUjJU?=
 =?utf-8?B?cnc4VE43bkhId2xENUtRMWxwUGY2Tjc3VnJCaUx5SWlTbDZ5QXMwVG1ybkdt?=
 =?utf-8?B?ZVJVQmkrRlRyN3ZtWHM4T3dkSjQ4Ui9zLzNvTTMyOVlmY3RpVFRiZjBkQVRT?=
 =?utf-8?B?NHJXTlhiVWdzRkdXTU9WcTdpZm1IbDZDMXJDSXh5cVpNOVU2STBiMlREeXFp?=
 =?utf-8?B?YWErcml0YjF1U0o1R2tvTmVsa0NvclpUTGpHcHJoRERSM0JkUk5LRHBVMFk4?=
 =?utf-8?B?aFlnY09ieGlnUmt2S3pjY2gvUlc4K2htN01aUWlKT21uMy9uRURRcWZUWDRi?=
 =?utf-8?B?TUc2WXVKb2g5LzZZbkV2MzExbUZWZ2hKYnR0L3ZKTUxmSkMwZ3BiR0FjUWMr?=
 =?utf-8?B?U2pZRXJ2UnN5cisxdHlLWkVhTUtiWEYySXplOFBzWFpSclBCUldQOURTVUJV?=
 =?utf-8?B?RnJZeGdTRjFSbHdaWlVubW53MTNmNy9RTXY5SG93bjdvRUFOakNTejAyTHZs?=
 =?utf-8?B?T0tqWkhWWUNYbXJUWXlpYVBPYXc1bVZCRWR4dnFDSXFrT091bTBDNU9PSTNU?=
 =?utf-8?B?VFVDd1NsSjNlaFd4bkNxTkpmVDBUSmZsTHZNQnJkcWF0MGRiVEgvK3Y2cXNW?=
 =?utf-8?B?VkVQdnZPSTlsQVcxZHZNQmkrSDJJbUtPVEFmUTRDQ1BxdnFHYi9FQjI1L2Vh?=
 =?utf-8?B?dDR2Sy96SVFyNzBhU0tSblV0MnpoMFN0TTVoTDMvTXVJYjVEWWd1Yld5WU5G?=
 =?utf-8?B?R2NWcDBNYllhUCt2cm9qQ2M5aDhDaUVtOE54RzRHRWQyNk91emtlMVZGZytm?=
 =?utf-8?B?NVJOc0dxbUhlZExwalkyN1cwQ1h4WitTajZqb1pGd1ZOMStyR05FeGEvUUVv?=
 =?utf-8?B?MzVTMlNDS1ZMMmYvQ014ZDB3YmRQVWw3TmEvNEVURHA5Y2FWdm05VnVLQ0Ja?=
 =?utf-8?B?Q3BHa01LeXF6NjNlVEl3SVdRQjdKODZHbU5TcUNHbUFobFB0ZUhIRWZaNFhG?=
 =?utf-8?B?RlZvUnZyeUR4emFEUGR1OCs3YlcxUERyQnlCbmFQa2dHKzFPbmdHa045ZDZY?=
 =?utf-8?B?ZzliN0NqeWQyQWxDVWNWc2dHWmhHV3pkZ1FLQXdiZVlGa2VJYkpKbjByNzd1?=
 =?utf-8?Q?uEd5lKtE714IwZZFgy7FM54q/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5392a029-c3c9-455b-e14c-08dbd0620a9c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 05:12:51.0079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATlrHojEJKnIJ51v9g16rxaurZ6Y5iBQWc6xIoPBXXNI5SyPJWL7Q4Das2SP21spGn8QWSnASmqZfx4fGzdwKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4249


On 19/10/23 15:43, Dan Williams wrote:
> Alexey Kardashevskiy wrote:
> [..]
>>> Yes, it's been allowed in loop declaration for a few kernels now and the
>>> new __free() helper in cleanup.h will make this model more prominent. My
>>> sense is that it is still not open season on mid-function declarations,
>>> but __attribute__((__cleanup__())) usage needs it.
>>>
>>>> Since you are doing this, move zero_ent below. Or, better, use
>>>> guid_is_null().
>>>
>>> guid_is_null() is not techinically enough given the specification
>>> mandates that the entire entry is zero.
>>
>> Well technically it says that guid, offset and length must be zeroes.
>> So, (guid_is_null() && !offset && !length) and no yet another static
>> declaration of a bunch of zeroes far away. I even wonder if there is a
>> helper to check if some memory is all zeroes :) Up to you.
> 
> Ok, I switched to comparing each field to zero.
> 
> [..]
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	memcpy(&hdr, buf, sizeof(hdr));
>>>>> +	if (hdr.status == SNP_REPORT_INVALID_PARAM)
>>>>> +		return -EINVAL;
>>>>> +	if (hdr.status == SNP_REPORT_INVALID_KEY_SEL)
>>>>> +		return -EINVAL;
>>>>> +	if (hdr.status)
>>>>> +		return -ENXIO;
>>>>> +	if ((hdr.report_size + sizeof(hdr)) > report_size)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	void *rbuf __free(kvfree) = kvzalloc(hdr.report_size, GFP_KERNEL);
>>>>> +	if (!rbuf)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
>>>>> +	report->outblob = no_free_ptr(rbuf);
>>>>> +	report->outblob_len = hdr.report_size;
>>>>> +
>>>>> +	certs_size = 0;
>>>>> +	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
>>>>> +		if (memcmp(&cert_table[i], &zero_ent, sizeof(zero_ent)) == 0)
>>>>> +			break;
>>>>> +		certs_size = max(certs_size, cert_table[i].offset + cert_table[i].length);
>>>>> +	}
>>>>> +
>>>>> +	/* No certs to report */
>>>>> +	if (!certs_size)
>>>>
>>>> Nit: WARN_ON_ONCE(i) here?
>>>
>>> Seems harsh for what could only be a firmware bug, panic_on_warn users
>>> would not appreciate crashing the kernel over something recoverable like
>>> this.
>>
>> This would a HV bug as certificates come from the KVM. And it is
>> (slightly) more likely that the HV is trying to trigger buffer overrun
>> in the guest.
> 
> Added a dev_warn_ratelimited(). WARN_ON_ONCE() is too heavy as I expect
> panic_on_warn policy has more reason to be deployed in a confidential VM
> than other places. >>>>
>>>>> +		return 0;
>>>>> +
>>>>> +	/*
>>>>> +	 * cert_table reports more data than fits in ext_size the
>>>>> +	 * userspace cert_table walker can decide what happens next,
>>>>> +	 * truncate the output
>>>>> +	 */
>>>>> +	if (certs_size > ext_size)
>>>>> +		certs_size = ext_size;
>>>>
>>>> This sounds more like the HV provided a broken table with offset(s)
>>>> ouside of the certs buffer. The HV is expected instead return
>>>> SW_EXITINFO2=0x0000000100000000 and RBX=requred_pages_number, and the
>>>> guest to retry.
>>>
>>> The existence of SEV_FW_BLOB_MAX_SIZE suggests the driver is not
>>> prepared to retry. Retry support would be a follow-on new capability.
>>
>> My point is that you should not get into the situation when this
>> calculated certs_size is greater than ext_size. If this is the case
>> because someone sent too many certificaties via /dev/sev or kvmfd on the
>> host, the GHCB call won't return any certs and will ask for a retry instead.
> 
> I understand, but given this needs to walk the entries anyway to size
> the buffer correctly this sanity check is "free".

I do not mind the check at all but this hides a potential bug or 
malicious misbehavior attempt. I'd think a CoCo VM is very paranoid 
about such things.


>>>>> +
>>>>> +	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
>>>>> +	if (!cbuf)
>>>>> +		return -ENOMEM;
>>>>
>>>> In a such (unlikely) event the function returns an error but does not
>>>> free report->outblob which is going to leak if consequent call succeded.
>>>> This new no_free_ptr business is confusing at times :(
>>>
>>> If this fails it results in the attribute read failing and
>>> read_generation does not advance. The next read attempt will free the
>>> partially completed report and retry,
>>
>> Ah ok. In general, it just feels like every use of no_free_ptr() defeats
>> the whole purpose of __free(xxx).
> 
> no_free_ptr() is there to say "we correctly populated this buffer,
> there are no more error returns in this function, transition the
> responsibility of freeing this buffer to the object it was assigned".


That's what I thought but there is one error return between the first 
no_free_ptr() and "return 0". I agree there is no outblob leak after all 
but the blob hangs around for some time and all this __free() machinery 
is supposed to auto-clean everything right on the spot before returning 
-ENOMEM. Grouping all these no_free_ptr() in the end would make it 
cleaner... Again, I do not insist.

And btw thanks for doing this! I never liked those ioctls :)


-- 
Alexey


