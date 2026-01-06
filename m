Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DE023BCFD
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 01:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767663910; cv=fail; b=BJvQA/jzTB1WsCeyc8xs8+fps2DfAqVgopdaLAv0vVQIcm0RQjyfro+awCx6MdGB+Ct6rvgy5hcowvQVZzX1oF9P0Un0RRsRmLNuI7YJtvqAisEdQ5/LYYRasmJVmdTir3DvNT8Q6LHgzplpmnpocU1HCCgg+CwO1Fl3wtwf9X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767663910; c=relaxed/simple;
	bh=rZjbNqEKnBQA7GLOoqYxeu9RsgYqW6huGQLzp3Cp7Tg=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XCljthxKYxkOxeshvfhUu3bP3fR2MqUDO+s4tNOZrEWaSoYHncKgzhZDgHIbVJflY0/yyzUGV9EL2S2XoZmnmsc+kuPn9+Ne2OqRy+WAxfqydmMTcMJ5gaKUha7vcuqDRotiVcNTTb/v99nE9kI32GLxFunBKaciNt7QrsLK9HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=wX/U9CyI; arc=fail smtp.client-ip=52.101.193.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="wX/U9CyI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTzAmStpk4ZJf29Fn+eySIVXL/jZlJiU7neWgEZPQx2JoxueVqNzTjmAEgqW7cd2zwFpe9+O5wtwIMbwxR5UzL3kZrLkJTlYAkVmzAdHRTm9MMsRyNSylPCEJfFzwsW9mLv1wiArejy1437u9fHjN189bSirVFdaVZIzZ4YXhBND0ViTWPeOF8UPti5OxUA1I3PPqz1nH2IN7dwUtz9BUyJIcbA9rOcVGF+rs3cfBQHF4fGsL1V8mjJ4n3kIeuywh38e+ekYUfwZjEiRekshJjd7hmJ0LzIf5kebYjQJbsxY5IPXY/0N38e4YAvIN8DHh5aPNqd/uhd20YxyGSmCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZjbNqEKnBQA7GLOoqYxeu9RsgYqW6huGQLzp3Cp7Tg=;
 b=k04c2TU4pK0uqNO6hR7+yT523gLRzPXwtMreoDnWIR0b3L/+YgsnsP+HJsZi8qFSDwP0xPfH8+vGijZ35/yVS6HzvEtBz541gIQXWi6SmKdtb9JIkoXs7OQc0SwwHTw6I44/kBzW/hUsPYf+MaFpit2VsJ9JbLad59VzdNskoiN1pwtB/4kO/7xc+rSYBi2ax1SVNVmZpzkbnQWr3rvDOpA7G46msrJmodjJGn+R353Ne3k6LdCkGYxLpPr1A2WKo2GNrF7gMeclVKRvwyPt+DLldndsUeJZmJMPu1yUM1oIylF2eM3tunJ5v+779E7sgkXgevEkXBIxLGGBtQhhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZjbNqEKnBQA7GLOoqYxeu9RsgYqW6huGQLzp3Cp7Tg=;
 b=wX/U9CyIs+RZgTjutEvIpd4dDqbBGWDlBqXa8boyrtNlC2aAr8eYgagdE/5Q3ozhYWAlpFzGTKrtu1frf92TnnckCGGKuabxokJf09VHdyWJedIEM3e1k4loVVoH2vAagJmz0ztPONTQgS80U7dsTYP8goEDWZLJ7vgQJ0HdUhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB4954.namprd03.prod.outlook.com (2603:10b6:5:1e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 01:45:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 01:45:03 +0000
Message-ID: <4f3e1701-3ccd-4ee8-a45e-3872d71ef548@citrix.com>
Date: Tue, 6 Jan 2026 01:44:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, john.starks@microsoft.com,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: "Paravisor" Feature Enumeration
To: Dave Hansen <dave.hansen@intel.com>, "Lange, Jon" <jlange@microsoft.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0290.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::14) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e098ce-1b6a-47a1-0bd0-08de4cc535f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmhSQmtveld6TE85bkxiRU44ZURUN3NiYW5jaS81TG5lSlVodUhhK0ZFbUpU?=
 =?utf-8?B?ME5hUkV6RHJieWluT1F4QjBDdFVwZDgvVXVCZmdTQUh5Z21tc0FkcnMzT2U2?=
 =?utf-8?B?VHF2V3JSRGNoZ2laZHN4bjJZRVJjTStWUWlGaGZBZGk0N1VTY0VUVGdPcXBQ?=
 =?utf-8?B?M1o3cWFVQ3dYUTJCQUw1Vm5VRW9rT1VDRy9aNXIxUSsvbTcra1BsYjVYMVhj?=
 =?utf-8?B?QjRkZkliOUZHandDSldsT0xGREJqeE9ZQkt5WTNHWElYenBheUx2WityaHkw?=
 =?utf-8?B?TU5ZTlNBVW1ORXlHRTQ4U3VBUFVGTDdJUFB5WWxrcFM4NmMwaVlTa2UybHYx?=
 =?utf-8?B?VGoya1gvQUIzTjQ4VGtxYTU0NXc5RVhjcjVvSjJSdXY0b0RWdlhRQWMrUnJI?=
 =?utf-8?B?b0hMVy81aVpyUmo2WFFjSkt3RzlDUUloc2M4OU9KbGxDYXVkQ1ErTXdHQTh6?=
 =?utf-8?B?U1BXYzQ0RG1DNUxHMW9tS1l6anNhakdPRkVqVEFMNkl3UWdNZ0FPUmtrNVVl?=
 =?utf-8?B?K2RyZVY5ZEIyU3dMWHp5RUJKazNKOHo5bXRicVBZbjhMUktXMnJIbVllcHVJ?=
 =?utf-8?B?V2UwekdZLzRwZWpnNlM3OWN1SzJrNVhXT3N3bmc5Y29PdGVQSmRUcEtQTW9F?=
 =?utf-8?B?VzVqcys4Y3VXdnJEL2ZZdnNDN2ZESW1ZK1habCtYVmI2R3BGUUphSU9uZjg2?=
 =?utf-8?B?clU0cGMxWmhOaXMvbEVDRm5FcjlVT0NUekl1VkY3OXYwdWZsTzRmYTZ2eWhV?=
 =?utf-8?B?b3BuQU8rV0dYYjlCSmMrWUdYeWxMU25wbVRuUWthV1F5OE5WTGdRMnRnbXBp?=
 =?utf-8?B?clZYWjUxdGNhRmFUQXc2UEdJclg3R2lXb2lyTUNIcktTa0Y2ZlVRbXRIbWhC?=
 =?utf-8?B?dUw1MW5DbzZ3UGl1VnJ6dGU0RjJZYmExTkZHaXBBSmFTdldsMGNVeDBobEdG?=
 =?utf-8?B?UjRDb3duL21SMWxmK2dFVHVwU3dsT2ZJSks3RFZvNk5vaEo1cG5GVU14R0hx?=
 =?utf-8?B?WG51bW5RWk54UzByMENVcmkvRW1BUWZhQ3k3TjFOa04vQ1pJVHpsdnorbTli?=
 =?utf-8?B?NkpSRzlFdmd4N2oweThVVENaRDhjY1lxZlFrZ0J6ajVtSnRtRXBJS0xRK0dG?=
 =?utf-8?B?OHBqS1JSZmhzSmFqLzdRcVJGNjBEdmxCMDU1Z0V0RTNJMWRwRFNFVGRmYWNp?=
 =?utf-8?B?MGZSUzhGZmRNZ2w5cGdDQnRkNnZERzVQUHdEZnRuS2ZZVDdic1N0Y2FhZ3pS?=
 =?utf-8?B?UlpqWkZHR252WTA1WHpOYnRqeGFDNFN6VWx0NWt5TEYzMHF5V2tPTC9Yemx3?=
 =?utf-8?B?ZEJKS0RBYzV1a2E4RERoM3lQSjBKRnVnb2lVTlJHbFdYdU03MnltR3VBa0Rt?=
 =?utf-8?B?SGw0NEhHVDYwcnNhQ2xFWDRRaktIQnZCczJpTC9KczIvQTBQc0tiaHdQZXk3?=
 =?utf-8?B?N2Nub0c0ZThYT0VMMXdqYmJzbC9iSFJ4SEUzejYxMDBPVUY4YjNUVmQwVmZL?=
 =?utf-8?B?c0FTMzBiTU4yd0pvWUp1dDB3c2wrTXRBeTJySUFKN0ZzVktZcElwVU8wR3M4?=
 =?utf-8?B?TVZVZWJkbGFFdmloaEV3OHVrTElQWkcyOGp2K2diSkg0OVgveHhpQkR0UFc3?=
 =?utf-8?B?Qkdpc2ljK0k2ZGZUUU5nQi82dE5pcGZLaHRiRkxvbDRZazRQS1FPdUpwdVpF?=
 =?utf-8?B?cTIyRjRFZ2tka1NrWFd1a09FNGs1T1l0ZEFiRUUvMVBLZEFGVGN1RkgvNGd5?=
 =?utf-8?B?R2dpcWN4ejc4K0FSNDBqRDBHOGUvRzE0RGNXaVZESFNVWVB6ZXZFSHZJSTJK?=
 =?utf-8?B?WkdOaDAzbTZQTG9zQmlKZHVUaktjY0U3dFpzVTQyQmJwZWhXVjFPVklUcXUz?=
 =?utf-8?B?cnJ1ZVg0R0s5UEkvQWorQUVLclpaQ0RlVi83OVZMRzVnNGxpeUJYd2FwQ2d1?=
 =?utf-8?B?SDZZQkdhcmZYc1ZHdU94MndoaFVEdHJ0YlRScjhVU3owaTg4cVAxT0xyVDdB?=
 =?utf-8?B?UXNnMm1EWFRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm12V0YwN2p5Wlk2RWZNemFla3c2R01WSU1VaHQ2b216RE9ycWM5ckR6VDgz?=
 =?utf-8?B?L0V3ZDlQQThwbkpFREdmLzJjN0NoVFgwdTE4bkl0b2RzVVB1ZTJ3eE1maHRj?=
 =?utf-8?B?YndnVE15WWR4QVQ5OG1ROVRlRURYbzZyeUo1V05TMzc0WGZBNUl4VEtLeTBa?=
 =?utf-8?B?RXNJaWVLbUJYM2l1aTFEbnNFUGZ5QjFmSW9ubjIybjFvMmNlU2txYlpCYXdV?=
 =?utf-8?B?V0VpU1Jnc2dDTVQwQkE4UzB5M29FekVhMVJ6azBvU0N5MHR5NHFpSFlZOThx?=
 =?utf-8?B?c2ZoenkrYURTNHBKa2ZsS1ZwblFOL0hRVTBrKzJ2OGp0eW9TKy9MWVJIZkxH?=
 =?utf-8?B?QUxGZ09PVFJwOENxQnpKQjQ5MUdJakxxTXNJL283aUt3eGxhanBoeGdqYUxl?=
 =?utf-8?B?SHRaeEN3M2t3U1dhdERzMi9lZHllY01qOXNyQUpSbHdYYjN2MllMWWdoTGlJ?=
 =?utf-8?B?OU5xSzQ4RVd2Y1VwZ3RTSndQOFhiamxlbXlOYXA3QzZHKzFCSmN1Mmkya3Zr?=
 =?utf-8?B?enY4Z1JramJoMzhiVWliK3ZXY0F3U1lSZ0VIS290Ti94RWtZUkR1NERPNFky?=
 =?utf-8?B?bDFDNENKUnJPQkVRZW1oRTh0d2d3TVJYU2FScStVT05JY2pVNzlXYjNEOFlr?=
 =?utf-8?B?QTF0VzA0R2R5YlF3Qnc5Rnc4VTZHdG5QbzRsYVZ0eHJSdFI4Y3gzYTZmRTdM?=
 =?utf-8?B?UDJXZjc3U0MrMVh1OGp2VkUvZ1VNN3dnaWJZai9HQ3VJVER2Zk5JUzJrU3pZ?=
 =?utf-8?B?Rm5PTmJlZmtsUStqSXlDVzdwa1pjWXJrZ29DYURNdW54c3EzTnlWOXJNdFNY?=
 =?utf-8?B?NGFQTnIvOHVGODVzWkhKRUU4em41c3RrVDFNUWlkNktNRW0rLzM3UmJtU2du?=
 =?utf-8?B?bUxhMlpVb01ZR3MzZitYWi9rLzZLVC9FSndkYkZLQ3NRRmI5Y3JaYTlUTitl?=
 =?utf-8?B?ckk1RUhCaXovNis2TW9pdytORjRTcXFDMk1IQ1I1U2lCTmRzK29yTTNkNDA1?=
 =?utf-8?B?cHovbDFoMlBuc21QUHE4eWM5ODJpVXpoaVhKNWtVSWVyV2NNeFUxbFdwZHcr?=
 =?utf-8?B?WTRsYWVvVndpSERvaVZtYkRnc2p5UGpQWEZ5dklYZ3R3ZDJwV01sMTlFRG4y?=
 =?utf-8?B?djZ5ajg5NGtPelJhWUVuYTY5elVmQWtuV25JN09kN0NPODVIcisrQkwwNlBX?=
 =?utf-8?B?YW5wN3l3L1MzbVlvVEs2dVAyREwwWVk2aTZ2emw4bEdHRzhBZTRodVlUd1Mr?=
 =?utf-8?B?R2JVcmNlZVJ5d0tEVjRmYk5hSmR6dFV1VTJudXlMeVRPdmFaZFo4d3NnMHhY?=
 =?utf-8?B?dFRsOEdycSt0SnZXQkt1cEdSYlNCWEpRWDkvMWVTTXNDRGh2dS84eElJQldF?=
 =?utf-8?B?YldOckwxRk9xR3I0YW1EUkplb1RsOHZLNGs3aFVzTUJMTlhFbjU1UERtTlVp?=
 =?utf-8?B?TG1QRkNpMEQ0dGlQanQraXBNZGVaYXlob0pWUmVHTTdZSkVXYlRoQTIvbENT?=
 =?utf-8?B?bkVjOFpOa3B4QTlYazk2V1E1OWVTSlp5YWlvTVFuWHpXUkYyeDRlSE1XQTlO?=
 =?utf-8?B?bVRYd2FNeUFkZkNtNmR5YUQ0Z1BiRHd6N2c5WW96c05Nb0xFTW5Va2g0S3FT?=
 =?utf-8?B?SnJxc295TlhwSXdwbm5wRGRjWHNYUkJoMWpKZUNIcWpIUDFvekROSGw5aS8r?=
 =?utf-8?B?L2FObDdrUjlzMVNiT1FYVjJRWUJ1SUNyUTV2c2hJMnpxYVA0bVhjYjVCTGRJ?=
 =?utf-8?B?LzVmTHd2eGVaREN4ZWFJNXc2OGtUdCtjRmxGcEtlY2pKWGxQNThJTWpOdk41?=
 =?utf-8?B?MXJVOUFENkZhVzBnTGpOcTFhVENyNmNTQUxOQXZYeHhkOEJmSFdUcjRWUjJY?=
 =?utf-8?B?dllDZnFRQWVBdC8xMjZ3SG9BOGloK3ZCSU5jZHRPeEcvYWNnc05ObkJzVWVJ?=
 =?utf-8?B?bDhYNmwzSFFwb0ExSm1mei85Y2I3LzVTT3pRV09rdmttdEJrdVVqZkIrVkl0?=
 =?utf-8?B?aTZhNG5jMmF4VzRQTkFTSmVKeUhpSnQ0UkdDOUFrdm4zUWZ5b0o4VndMMGx0?=
 =?utf-8?B?WXh2dlB3bW40Nkd3WWdKZ2ZjdE91T3FrZ3JZQjZsK3dROFlNNWxUZXM1RmNS?=
 =?utf-8?B?TUlNU1V6Y3BDL0IrQy85WU84cDJiWHdGZTRRcUdzbVlhdTJ3VEYwNG1wb3l1?=
 =?utf-8?B?MUFoMzhEOVZKYS8reHZWSmxrb1JLellvNmpVZ2JkSnBTNVpjekZ2enhtRFh4?=
 =?utf-8?B?WFlQczNUZnVJalNtV2VRRHJCTEVZQkg1QTBlMXorUUNvMEFKTzFWRHBocElL?=
 =?utf-8?B?am05TE1jZGgwREZISFRMUDlOSUlNUGNaeEJZaUdWR2M3KzhUK3h0TWxpVkxS?=
 =?utf-8?Q?RZezYrPBADA21cl0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e098ce-1b6a-47a1-0bd0-08de4cc535f1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 01:45:03.4804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfjAYdy72kjefLsXRahHvG9eTV/oQlwM4ElVeeh8jwlnRoGaSRfg4o0D/9YFohIqs0AWoy1Z8FyFNAY2Xd+JcVwhjMZZ0SdjzaHLI2Fw3v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4954

On 05/01/2026 9:42 pm, Dave Hansen wrote:
> First,
>
> Jon and John gave a talk in Tokyo about feature enumeration under
> paravisors:
>
>> https://lpc.events/event/19/contributions/2188/attachments/1896/4057/05-Paravisor-Integration-with-Confidential-Services.pdf
> The tl;dr for me at least was that they'd like a common and consistent
> means of enumerating these features in OSes, regardless of the
> environment: TDX, SEV-SNP or even ARM CCA.

I agree that it seems like "just" an enumeration problem, but despite
attending the presentation and rereading the slides, I'm still not clear
on the precise scope.

Are we saying that, inside an opaque blob that a customer provides to a
CSP to run we might have:

* a paravisor and an unaware OS, or
* svsm and a fully-aware OS, or
* something in-between these two.

and we're looking a way to describe which piece of the interior stack
owns which capability/service?

If so, it can't come in from the outside; given that it's the capability
enumeration, there's a chicken/egg problem with verifying the integrity.

It seems like it needs to be produced by whatever the first code to run
is, after gathering capabilities in a vendor-specific way, and deciding
which services it wants to provide, and which to delegate.

And if so, then it definitely cannot be in CPUID because that needs to
be fixed from prior to the guest starting to run, and doesn't express
dynamic properties of the system[*]


I think the discussion would benefit greatly from having a couple of
concrete examples of data this wants to hold, and how it is to be used
at different levels of the interior software stack.

Thanks,

~Andrew

[*] Yes, I know CPUID does have some dynamic properties.  I think most
people would agree that life would be better without them.
