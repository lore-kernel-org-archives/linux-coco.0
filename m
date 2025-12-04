Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573C134B19F
	for <linux-coco@lists.linux.dev>; Thu,  4 Dec 2025 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764858018; cv=fail; b=q539EPYvz9lJk0hu2tqr62efePJPIavN68JpxtXvs9ZYJa9OgBcvFYy/UazSlbMP58Gygmy2sMIAJqe3vvPXaA/S1oL6pDOBnDLvx9/m10tcd+xv8ai7aVoLMZW/KYQ2rWuD20F515BLDKWjcZzLw8nFdHsVZjB97HMw9bEFzXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764858018; c=relaxed/simple;
	bh=bFt/N5xk1aiaJzKtD4gKT9ghD3oNFzcsnkb8g812+8k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hPHFF9ieUTUT3aCAAVoBf5jslZd2EjoN4wzKzfsUk0SqIH+uDPfLfa596RGo9F2awDQq/CgWXogP1h/HzFyqHVMZwFfQyxYdr/TpDI/Xgd7CDmdOZB+rxEPIarUiVgPSYDes6dvz/FvIj+MwoPghLLqONGps2Vg7ak+uaBKV3sE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n/joEzWE; arc=fail smtp.client-ip=52.101.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n/joEzWE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fag8rXY1/NDdpPqevmG5FnVzUW2K6wE8tg2eOnhJ7NgK+jVmCN4rHHHEYT/5cg7myRyMnWGqatRTxWI2inxaaW+4plqffclPhfwYiAuzEQcBUXdq5yoikDI2+JUR91d6uEaTO4hYoHOVPblR0lZbWjPclXpqrPHjW1bY7bAnWI1TBs1vN2tmQCZbuJbxVBnyxS+RyWzE6PmvjTnmFchIXbCQq6DKsncOxNP8om2TxMise7m65qbeFHDsDPsGBEwpR9Edr3CVrNyZ5icVn4LIUvczmGLFPWpFjwnHQcWBSCKRydkIXIR1uQ0JOeSxxVeqvcmaPHEr1lUYisJgmZKsRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlLEl1+F5ZVeo01yhyuwzbCl123xiQRfyMgA428NcT0=;
 b=EjJivZKzzOsrG/OQHgartI9jXVpdy/7+NUxY08VtLrkTeetAZPTeRqb03jdrclg9zQ3mPx4xtbNEWRFYME4o6HspMWrg3kPRRbjOVL4eCyychbaS9X1P5WwjP/xLnm0RSJxZkKci7yvrnIy6d04NQOulX2cgIKq9nZgzf5YDfOTZaOxEXX0PEsFCUxve+40cjgccjTv4qOw1QbRnHdN786lMQ52oKl7yS2akP7maomyOKDGrbr3ynjv/6zeYHv2jkng0k7P0Yn3UcbUWVSCS7R1+w5ua5YqqmGlLjxWc/v0aJ5BXSqHDRDomsUmiFTrJEDegLBmngBmL9xsrFX/sJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlLEl1+F5ZVeo01yhyuwzbCl123xiQRfyMgA428NcT0=;
 b=n/joEzWEraOlITPZk3cl1iGqSQErlf2Ks+cQz2gvWNRoYiNhspEGwqBdPPFcdrLKEcJaW1MUHVjeiNP62/T9ht//WsjV+JS8qO9RsAif6XkX1bzQTun93eKNKHKKKtl6ttGyIvMKlzru4cqp7YjVTySkcRQ1xD0vOj+9iqhgVzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by CH3PR12MB8281.namprd12.prod.outlook.com (2603:10b6:610:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 14:20:03 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%3]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 14:20:02 +0000
Message-ID: <740dd1aa-a1b8-46d5-8b9a-ce03bed50dc0@amd.com>
Date: Thu, 4 Dec 2025 08:18:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/sev: Move the internal header
To: Borislav Petkov <bp@kernel.org>
Cc: linux-coco@lists.linux.dev, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>
References: <20251204124809.31783-1-bp@kernel.org>
 <20251204124809.31783-2-bp@kernel.org>
From: Tom Lendacky <thomas.lendacky@amd.com>
Content-Language: en-US
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20251204124809.31783-2-bp@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0075.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::22) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|CH3PR12MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: c512c32e-7d37-41b4-3711-08de334036f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzhqSy9QdnowcGlJK3F2b3NJcVQzT25ndnJMTlBwVm9PNzN3RFFrZWIzREV3?=
 =?utf-8?B?RDA3bFAvWXJuYTREWkNLVEFJNXE0UkkyVitjeUI2RzJ2bjR4ejVFd0g0WkNa?=
 =?utf-8?B?aXhaMHY3RVdKSFdLV3JWNVQvMjEvR3pRV2NRRFRhWmNCZmlDVE1TQ1NnQ0Vt?=
 =?utf-8?B?eW5BVys2TVdNU25WV3k0d2M3UDdDQXpJSkZlNmdtZmRKVldSTnVmMjc1ZitQ?=
 =?utf-8?B?ekpWL0ZKdXI3Yk50bU9wc1VMZEtOMTVpT3h5RUl3TExiellwKzdJOEhqbkRI?=
 =?utf-8?B?OVV6di83L0llMHhWSTlRMDdCL2JOL05EbWxnTUJoT3UwY0dqZUI3Zlc0Vkts?=
 =?utf-8?B?eWlQVWg0VVhua04yZWk4UlJibzU5REQxSzI3TVZ0Y2FTb0ZTTm54ekgvNFRM?=
 =?utf-8?B?dWwydFB4RHdkZ0lxczlmNmVuSkRGSU9UTUlPZjdXWDluOC8rajRWVjBLSjVF?=
 =?utf-8?B?ajFFTm9xNGZ1RmY2REhGdHRQSGZXMDNtVDdQckI0YnlRcE8vVFJHZEFvankz?=
 =?utf-8?B?ZTUrbHF1YzFaVjAzdUQxUU5jNElEdGpLSGlPVDBRTjZrU1RpQi93elZkcFgw?=
 =?utf-8?B?MHRWOGFhT2NINUFrQTFKRjc4ME9CQmo0clJIOTJFeTFHR2FJVDJMSlh1d1Va?=
 =?utf-8?B?VzNlTVk4aGpmdm96VmpwbUZzTFllczFuOWhhajJubWxYT0Y1ME9sQnkzS0g0?=
 =?utf-8?B?R0VZWG1MZnpYL0VSQnlNZmJ1L0tBUHJJRGVKQ1lqRWhyN1RQbHVHL3Z6RFJ5?=
 =?utf-8?B?aDZPZDRCSTdsTDJ5NC9xUFhnK1QyTjZhdFl2NG54STdCMGhJTVoxVnpRaFlZ?=
 =?utf-8?B?VCtaTG5XaFZ3NDFKY1VGdk1RWE11TzF4aThtRDdGNGNhblVybHpKWGxYcW5s?=
 =?utf-8?B?VmwyUmhVbUJIMmVIL3YyYjA1NDVYMnBFaUtwLzNmZVdoZjIzWThNbDUwSkVm?=
 =?utf-8?B?SXhTemduTzJ0U056L2wzZ2N6SVZXZXRQckxzdW8vRVYwT25hT2FpTm1HSmZt?=
 =?utf-8?B?bHRGMzg5ajlKaWpVUi9waGoxMmpGVHJEaGlnZnp0NDBSZzRaNmppK2lRN0RN?=
 =?utf-8?B?Vm1sbWZBMnl2NDV3Y05PcVRvMVArRUluOEtUdDdoQmlGY0ZKNFlVWDU4QXE3?=
 =?utf-8?B?WmdVVVpxS1pmL1hWTmEra1BxTjQ2cmtpZjZvd2JwZmxoc1NrbjVMckhxTURJ?=
 =?utf-8?B?SjhESVFvVnBuSTFqN3hSaTdacUFpbHpEbnBySGxqMXpXUW5uUWU4cys2bElj?=
 =?utf-8?B?dnI5c1VEQlZJR2xmejlVcHpNckJPYTFTZmZvN3BpWHlzV1pQRXp1N2Y4R2VT?=
 =?utf-8?B?d0NzVXhiYjV5UW1jWkJjOFRhTTRRN0kzNHd0dkZOL3dtTHVTZzJZMHJFVEFX?=
 =?utf-8?B?cGhEYnJlQU9SNk8rK1hTalorazA4Rzg1ejZDZ0dSSCtRMzZzdEdQVjJ6UDBq?=
 =?utf-8?B?d2RTdWFJNE8ybUdRalNWS0xMY3BDTVZFaC81T3dEeFVJakdGNFVMRTJ4VCtO?=
 =?utf-8?B?V2xnclRVTStJZFFTTFVtMlp2Rkd6MFBOcmo4QnpMa1cwblkwdTV2algwUkpx?=
 =?utf-8?B?Q2lCWlZXMDdiR1FXVis5RWRYdUduWTFaVEVZNThvQlFrdjdKRTJkWmpQcmds?=
 =?utf-8?B?STJhd0NyZ1hiYkJQWnI1K2haRys1cmhHazlJWUI0bTRxeFpZM25kNTFMS1BZ?=
 =?utf-8?B?cGNFUGRNbFNhVXJXSy84L01aZEJtWmNaV2xxZnZOY0dpOWpNTWdlQTB4SlBI?=
 =?utf-8?B?TWVaZW5Od25GcWVKbXgrV1NGSVZzRnMwWEovbnRYWjRLMnpDZ0xSWk1QWFVr?=
 =?utf-8?B?TmhRNml2T2dWaUt5aEU5dmxUdFJXMThUYUQ4Z0xVcThDbWZBdTRzaDBmUXhu?=
 =?utf-8?B?bXZuZnE3MDd6anNVeE9BUjcvd1B6aTJoMGpCYVRETHRoUnF5NkpBaFpwdHJN?=
 =?utf-8?Q?kevvWXCE6To7ekcqjJRcpz5xtxpE4eGf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDk2azhOeXV5ZTRJd00wZ0FRMFNzNW0vTDNqS1luS092SDhBajZYOWtuSHUx?=
 =?utf-8?B?dnZWMGZHV25PR2Rpc2JUaFFtNVM3SENDTEhkSU5FMG5RdXhCczRKQkZLMEdE?=
 =?utf-8?B?NU1NcGQ2eGlCTmszdjQrVEJDc2lVaG40YmNBaEg5SnpMbURXUzd4T2RKMHNO?=
 =?utf-8?B?VDlCTXpCa2VXNkNKeFp2K1FYNHFrU2laeUo1TVYvVFNSbURJb28vWVFyNjda?=
 =?utf-8?B?cDdpbFdsNEJNenU1bEVwZzBJa05JS0ordmRSN3E3aTFDYi85ZXhXd202ZGc3?=
 =?utf-8?B?UTJyajhDL2cyUGE5Ujk5RUR0a2ovcVovZVJHSUxIWXp3OHI5UEp6N3NIWDhW?=
 =?utf-8?B?c0l5cDZUamx0cS9IcmdGZkZ0c3BXOWM0Zlhrd0xHSWFUUXhNTkwzQWJoalJY?=
 =?utf-8?B?aVdhdGozaHNyNytBbnlpd3h2c0RWRS95R1pZVkNDbFhmQyt5dU5heEIwMDJS?=
 =?utf-8?B?UG9lbmsybDIxYjhtYWk1dWFRTnlTN1Y3NXlOOVJrdy9QMHdwemMxelVqLzVi?=
 =?utf-8?B?WXFucXBtam9RWXlJYmdFS2dWeGpZQ0VXa2lqZFpMaUxMV3AvUHZYZm84bGFF?=
 =?utf-8?B?dC9jVWZUK01Ma1JsckFlRzEzWnpkc2lEM3BuTnM0L0pjZnJNSXh5ZUVKMWZj?=
 =?utf-8?B?UENhQ21SemhqZWNOL2pjeWRoRko4VTJJMk5YWUR1UmpGbm5mWHFlU0ZiK0Y1?=
 =?utf-8?B?QlQ3ZkduRkNxTjNaOWZzMzJlVWt1NDUyb2U1cUYzRFAzNFFoQ1pza1lMNkJ6?=
 =?utf-8?B?VkRVUFVldCszR2dlYVB2THZwRFJXb3V2UnZhNlJrWk54TFJRODlPNGgyWFZp?=
 =?utf-8?B?RUlycVo0Q2ZiL1Z1cTZtbUU5amwydS9jWnAydndmLzlMV3R6aGcxZTNoWkRw?=
 =?utf-8?B?N2MxUzErZ0dFK2JLZXdjLzRPMk1CZDFYNnZaWm5FRGhkRUFzSzlJSEhMbUtQ?=
 =?utf-8?B?U2JpMWhBRGI4THlqV0JLcmxWaWJXOUpJVjlhdW44YmZzcW9xZHJ0NzYxb2Qz?=
 =?utf-8?B?N1hKV3ozdjFFTGh6RmI1bmYyQVNTNVMwdDlFUzNPT25hbUFqdWtGeHVsd1po?=
 =?utf-8?B?OXptVE42VmlVbUgrOWYwU0w0bGtiNlU4a0V1ZEduRkRkT2wrdjdNUGZaU1pj?=
 =?utf-8?B?c0t3Ky9lRG9WNlJITG12TDBxT2hod3ZFZlFkTjlQMTlYbG1vTkdaVUxrMlNo?=
 =?utf-8?B?d05uYlI5S3ZuRXBDWUdnSUZHdXJhUE96TFg4Uk9kNzdaYm9xZTVFWU50UGts?=
 =?utf-8?B?elo1RFJ0VzZMNkQzWGtBZDF1bDYwYXh0NVg0QzZ0U0lseHgybXZoeGR3dFFE?=
 =?utf-8?B?NDhTQkIzYnFXa1FpRjF6MXhMbzNlNUR0TlZkVC9PcE56TXZKUzN6d1A3RVRX?=
 =?utf-8?B?eTJLMUZEZXNaUkNMaHVzdFRudXVyZGwvQ3BGQ3BacHk1UWEvT1E0UmQwc1lv?=
 =?utf-8?B?NXBjUVZ4b1I5QzhROVBJZGE2cDlsaGdPWFZNV1QxKzZZdmVBUjdtTFp6ekFi?=
 =?utf-8?B?S2VvOVlOMjBLR0lOTVJyd2V0eVAxOWlKY0V1VzdyQWlsRjJqZWhDVGs0bVFF?=
 =?utf-8?B?NUl4RGhsYlFzQStqQ2ZPSVVFVWZiQ21yQWJIZ0piTU40ZXk3TW9oVWwzc1Uw?=
 =?utf-8?B?aXlCYTVHUE5OaFIydnRJUlRZWkVNazQ5bDc3UXRhakFZME5nUUw4SEFLQ2Zm?=
 =?utf-8?B?NlMrQkhOVnk5UDFHRzJvR2tHTE1BelhNaXgraldheXpzWWdxNHl2aXhMTCs5?=
 =?utf-8?B?ZmwzVGRTekJTL0ZzUEg4TnJneHRNenA2aUxSSDdnZDEyWHk5Q1hsSUhBZzVW?=
 =?utf-8?B?ZEJnTUsrODBQRVpCZjVzZ2M4NG9iSnYyY05GN3VLNTU3dGNBUUtTcEVvd2xE?=
 =?utf-8?B?MzZEemNrUExqU0FiOElOaHA5R2p4OEVDNlJHTU04R0tOL1RGUnN3cGlUZERK?=
 =?utf-8?B?eWpLdnppSFBYV1FmOUFhcFRTUWV0QTYrbVZsaDFMRTM0dmkybHpKR0E2ajcx?=
 =?utf-8?B?dDBDYXBzUkF3eXBDUEI0dG1OVTBmY1Mvd3Zudi9DdE9rMWJaTFpLa0FYWUlI?=
 =?utf-8?B?eGJhdGxjK01TZC9EaW1FaWpoSXhxZTBJT2RYTHFHOUV2ck1FSUFIZGhIOTBQ?=
 =?utf-8?Q?zyWDeWvLp3+VsigcLa4WCd5uo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c512c32e-7d37-41b4-3711-08de334036f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:20:02.7488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqieYw15j4SBBJEraxY6cOUEn0k/gzxRd4B6ilqyflHxw3aqnX9tnluSkgPFIoOe0qeZlxXNzjRDvmhVxcd/7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8281

On 12/4/25 06:48, Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> 
> Move the internal header out of the usual include/asm/ include path
> because having an "internal" header there doesn't really make it so
> - quite the opposite.
> 
> So move where it belongs and make it really internal.
> 
> No functional changes.
> 
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> ---
>  arch/x86/boot/startup/sev-startup.c                          | 3 ++-
>  arch/x86/coco/sev/core.c                                     | 3 ++-
>  arch/x86/{include/asm/sev-internal.h => coco/sev/internal.h} | 0
>  arch/x86/coco/sev/noinstr.c                                  | 3 ++-
>  arch/x86/coco/sev/vc-handle.c                                | 3 ++-
>  5 files changed, 8 insertions(+), 4 deletions(-)
>  rename arch/x86/{include/asm/sev-internal.h => coco/sev/internal.h} (100%)
> 
> diff --git a/arch/x86/boot/startup/sev-startup.c b/arch/x86/boot/startup/sev-startup.c
> index 09725428d3e6..1115214429fd 100644
> --- a/arch/x86/boot/startup/sev-startup.c
> +++ b/arch/x86/boot/startup/sev-startup.c
> @@ -27,7 +27,6 @@
>  #include <asm/cpu_entry_area.h>
>  #include <asm/stacktrace.h>
>  #include <asm/sev.h>
> -#include <asm/sev-internal.h>
>  #include <asm/insn-eval.h>
>  #include <asm/fpu/xcr.h>
>  #include <asm/processor.h>
> @@ -41,6 +40,8 @@
>  #include <asm/cpuid/api.h>
>  #include <asm/cmdline.h>
>  
> +#include "../coco/sev/internal.h"

Shouldn't this be "../../coco/sev/internal.h" ?

What is strange is that it works with either.

Thanks,
Tom

> +
>  /* Include code shared with pre-decompression boot stage */
>  #include "sev-shared.c"
>  
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index 9ae3b11754e6..4e618e596267 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -31,7 +31,6 @@
>  #include <asm/cpu_entry_area.h>
>  #include <asm/stacktrace.h>
>  #include <asm/sev.h>
> -#include <asm/sev-internal.h>
>  #include <asm/insn-eval.h>
>  #include <asm/fpu/xcr.h>
>  #include <asm/processor.h>
> @@ -46,6 +45,8 @@
>  #include <asm/cmdline.h>
>  #include <asm/msr.h>
>  
> +#include "internal.h"
> +
>  /* Bitmap of SEV features supported by the hypervisor */
>  u64 sev_hv_features __ro_after_init;
>  SYM_PIC_ALIAS(sev_hv_features);
> diff --git a/arch/x86/include/asm/sev-internal.h b/arch/x86/coco/sev/internal.h
> similarity index 100%
> rename from arch/x86/include/asm/sev-internal.h
> rename to arch/x86/coco/sev/internal.h
> diff --git a/arch/x86/coco/sev/noinstr.c b/arch/x86/coco/sev/noinstr.c
> index b527eafb6312..9d94aca4a698 100644
> --- a/arch/x86/coco/sev/noinstr.c
> +++ b/arch/x86/coco/sev/noinstr.c
> @@ -16,7 +16,8 @@
>  #include <asm/msr.h>
>  #include <asm/ptrace.h>
>  #include <asm/sev.h>
> -#include <asm/sev-internal.h>
> +
> +#include "internal.h"
>  
>  static __always_inline bool on_vc_stack(struct pt_regs *regs)
>  {
> diff --git a/arch/x86/coco/sev/vc-handle.c b/arch/x86/coco/sev/vc-handle.c
> index f08c7505ed82..43f264afd590 100644
> --- a/arch/x86/coco/sev/vc-handle.c
> +++ b/arch/x86/coco/sev/vc-handle.c
> @@ -23,7 +23,6 @@
>  #include <asm/init.h>
>  #include <asm/stacktrace.h>
>  #include <asm/sev.h>
> -#include <asm/sev-internal.h>
>  #include <asm/insn-eval.h>
>  #include <asm/fpu/xcr.h>
>  #include <asm/processor.h>
> @@ -35,6 +34,8 @@
>  #include <asm/apic.h>
>  #include <asm/cpuid/api.h>
>  
> +#include "internal.h"
> +
>  static enum es_result vc_slow_virt_to_phys(struct ghcb *ghcb, struct es_em_ctxt *ctxt,
>  					   unsigned long vaddr, phys_addr_t *paddr)
>  {

