Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795096761;
	b=0wQx+VpxRw0AMVtF3a5D6vDkpwKVlgg941PdLPJ7k1Mhboc7ihQDQzq3byQNEC4gsEoZ
	 H2O0XMRjU4ypAoXtfVQGlKeFwigrzMoaY1jmsVinwVI2Xip484gj7NvBbb4syXYs9hZ/d
	 HCFwNdMKktHSGOmdsmQ4QgofQixjqPqNO1VPZC2rUM0wELLGwq9qZ+7fgIPU8WSBPGK7Y
	 4t3GOtIzoCk2ARVrxW0/0eVOJl6LTb+SEIqrT0wVCXvGjCCTAhsGXilkkgOsJ4YtJo9Pb
	 dgmUUvMF+lwN4XAaGgOVTMgZoSUPkpEb3F59MnuCjraeiI1nnYK3LAkkEIcK2KWZ09g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096761;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ptj4ObkQFxXLvBbfPWVScLMosTmSNbAb5Jf9dnpOD1w=;
	b=WYFyMGahVUfek1olSgOda3owwCJ6wMIWYna31YecTb2+FuxdUJTqyVevg3m8rEfO6sEs
	 nilp95o5b4i3S3D49todn5w9osaO4imTL3q+vG90Y2mlOb7lTGoEqE7Wg9S7HWXHL7NVg
	 oyJCldXe8jXz5KjIiLqR1y3O6QDwkH+3kkhqXOLrikZKjNArRXXhgL2txyIA8sd/zvu3d
	 /DOh5ALKzTMQDKZPnn4Ik65LcMt0soeU0IA9noimFeyjkotiajCblMYEruL9cyT/G2gDt
	 VAi3KfelIJ4x32dASHtXH3SbTO93a/jxI8B5bep2/ddD7AotduAkyungQ+373gGhpHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KSub8YzR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.45
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7D8606A326
	for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 13:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KSub8YzR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyaYkVguOdamHg6J/nQil8Ce6PqZTkrmtkNU2CJ8HBxYWNvea3e3qQH4VxtBdgIHBAw9HC+dfc3FDs92C3ZssU93HcnZ9Z2IlpnF6+2fbqAby7Qw8yLOu2FhMgO3hXchEpePaCPe0MwSsDEvJ4/m2F7tF52TtNfIF+ZKt8Qn0P+Aq4qYYSVKUJpDMY6sxUdSjD6HWs+eD9HaNR9s1XUyrNrSrXjTy4J7sFGOSEmH7N/RxtbeuO2NCIOURA7/twWBxFPyZUCpLV0C5HaoX/mQuSga98pY2neFVbyKiskXxujhctTk864SNM64h/3Erihb8AjE+/900YSUW8OQmLA43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ptj4ObkQFxXLvBbfPWVScLMosTmSNbAb5Jf9dnpOD1w=;
 b=jAztZH00zTmx+3txDbYTQcLDlcduKITndJo2wZ5JRBgzPs3hvssXrDeD+174/llD87aDdHM/drzBTPa6X8NWjV48Mvmi0DyjivIBAqqVxDD/wlYmYgK3CV2ieblTqF2xPCLMUKEVCtWcQmDMgWUyCPQB+QaSC1scpf+AG1xUfamYAnGVfpraSl4xuOQkh2dVJRVW2aiychWfhtIJ5zutm+ShHuDUN3Oc2bY22eXci39dKCdL6ImKLKo+8BtR26CakbtsJt/Z4+Jdazs4deSZj5aQuUfoyJxTw4laSn0oW4sHuMkquI27R1eFniSfmJhv7YK5sEt1nDv95kd8YZ3zoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ptj4ObkQFxXLvBbfPWVScLMosTmSNbAb5Jf9dnpOD1w=;
 b=KSub8YzRQjrv48OPbF/vRXsaEqIgmCGKrApacNtcRKep3BPW6Px8GZx1rSsDvNaDey2O2+SBh/Y596i4xxlQwTPtecatw7PN18m1iLld5FeUIV0I6Pt9hdN0TDx39y8oifoWqKxeFLPeX2/8gCwr3CsaB0RtXzAIX2HTaCqYY+eJMKIY0EIM5th/MD6luaGokkgUkwfJJLKVrQmKstU/lb3MzjxjXft/871dDSIyQsJ1rg4AjINMB9RTirz3i6vgGF48oV5nmsR+jUQuxP4q80kOmZvB/nmxfbRVaWnNygI3CJT41J0d2FxnwSaViTwEro1g7vwI7lrt29JUNTfRiw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DS4PR12MB9636.namprd12.prod.outlook.com
 (2603:10b6:8:27f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 13:59:10 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 13:59:10 +0000
Date: Thu, 19 Nov 2026 09:59:08 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"Tian, Kevin" <kevin.tian@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"bp@alien8.de" <bp@alien8.de>, "Gao, Chao" <chao.gao@intel.com>,
	"aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private
 MMIO ranges
Message-ID: <20261119135908.GR2245175@nvidia.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
 <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
 <IA3PR11MB9136CAD09013FD9A79EB06ED926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a3ee7e7be28462bff75383f0ca3af1cb8275d125.camel@intel.com>
 <eb3a3d57-fd98-4167-b6fb-27025e737097@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb3a3d57-fd98-4167-b6fb-27025e737097@intel.com>
X-ClientProxiedBy: BN0PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:408:ec::25) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DS4PR12MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8330dc-7cb5-49ad-dec5-08df464548f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|261102123227099003|261026140227099003|261026121527099003|261028144727099003|11063799006|261022075727099003|261021121427099003|261022105027099003|4143699003|56012099006|5023799004|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	zSprIb4TtHti4E6gOB0wibiQ6K49ruEOS3Bk17/6WkBdaHRkyYvmNwIykoLOP/uKvR83QFw6ZOUY1A0QB7raw38mNttNIcr2TTTLoiFXIj4pAAsWCh67cbuyc7X800o9iIJQgqGlaJLBO3g4Y3BbFcIIHViE7QQ5C56+oFujaemCrQpBaZorFJ2zcT28D8uYMirrfT55dEjo7Lt4Y/i40hCdfs2WJnr/SRfbKxCyF737wMRoAlYGQhevjiUaqVWG9EUZMq3aUU+3kIVzE+nxqi0M04HCj1BBI+Qek4KzN1J4HIEk8ccQauDFcwUS4BFTURdC90dXvUGfOctS7z72we3Kb6RSPvTQ7FKVNmUpiau1U36GJf5o4eptNg7z9sW28i0zsmxpwqHsyHVcZRr+Fw6AkiQwodcV0Z0iJ/YVnXEfHiElZ4q9MBL6N/cLnwjqDExe/EbHTVgdy8MoxYhWzZK682dykPPX/8tOYzOm9mnujPynAGkkDid2z1Pelefs4YIuvECRmZ0D4w2NFgvv5h7d5gIMWMp92kO6EG6J07LHCQ6Vt64UCtOJA7YqFl6CEICm8vqKwWucR6QrZhXtpj2HvwggOhaPbvZ35DpEZRZh30pYsGuDqVw91bqdmIg7kxu4AgrYZodE+jJsngW4L4+62OV0lrSXmuxhw5iudLk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(261022075727099003)(261021121427099003)(261022105027099003)(4143699003)(56012099006)(5023799004)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tnNI05aDcabk8L3ALRtyfp1FAwjJuc2Bn+Zk9Njn4VDZhIyho5ZMlSISOdEN?=
 =?us-ascii?Q?P7aTjoY/RMyCqd5tebijacSV1zc5d/El0cbJB7RRufftQpq76z1IU+fPPgbX?=
 =?us-ascii?Q?lvDtc0a7fULbdV4fPn5rsMP/Ri9buC+8rSNCj1OYOmvCUGDe5+MNelN610vi?=
 =?us-ascii?Q?g9KqKH97V3h6UP/KWTw7KWHujLbWetjRyUIHAIlZHWQaMqv/rkmJ2rpZi8+L?=
 =?us-ascii?Q?u+bdx0gz4/LDr1DqPi7+/ErQhQQCcoOXMRw59V4qGMNkktfIkvcCLeWUWXOQ?=
 =?us-ascii?Q?fNrN+6KKzMbrf+FoJU6YzLuzt5pNeK1oxnhZ0VOMmzEK1h6DmcKHpSGzxHtn?=
 =?us-ascii?Q?Zi1QBR2XRyD/rcD1aVu/uHfhLb8s/k82F+sWZIwog/i3MPVrIdaMy+qRJLpv?=
 =?us-ascii?Q?wy0/RnoqwFYFwQIGtS+ml8ZPkntLWLdw2Zf93TIDXHXucRshHaarANLkd5gr?=
 =?us-ascii?Q?6/3i+aqYLS9qWkfrzxa3szz3iyl3grpzTR1ah+YFVN21hBSTOqWKbuLX+hjE?=
 =?us-ascii?Q?ko2Jc3MOdDM6+tlcnwfdeWW5zerNQ2pSBK6lu0zY+OEOVb0B6AcW7z8GATnU?=
 =?us-ascii?Q?6ITpBiR2Ivy4DIyY0Esg5O3Qbcfg/taqz4kg9swZGrbCwZ5VZ8mDDq82XkAi?=
 =?us-ascii?Q?GBHdJ+MRHW2J6zLU7SK7HCve45bbi7yeonF3J7XX+3ETRQw6gp3KpNlZ2pdW?=
 =?us-ascii?Q?YYl4nsy1YtP0Gcpcl5VnvrP+UJzesnSQCXMRyakMKi54Jm9T8Bgf21fQUkfn?=
 =?us-ascii?Q?US7UicMWDuTYJcoHolUbc8oUelxvMPku22cJzkjRPOTcD8ewroTqlSrY8JMO?=
 =?us-ascii?Q?2NuOd8XD3tR+2IhIxnENhe+dD76tny2YvJAx/xuU0jQLD3Mf7lAQFTpphJgV?=
 =?us-ascii?Q?D/Ahf4RrUvtQWl+JsTAuL7RVejT/wjsAAl1Uge7aEhDYCdLue1grlqvVSbye?=
 =?us-ascii?Q?3Rfbowf06MT73B2GgAEjaXBTdeP0A/tsFH0xJrgObWIF2YADxJd/Bhv5tfx9?=
 =?us-ascii?Q?4DPBoz5IQ2RR+PkONTlP7eESpr5HpBNT5CiQ9EGJMAB8c/K6QxdwVWdAWoXu?=
 =?us-ascii?Q?yvj7G57cpIuEdgvQGltx8BJ3+jlY8UztPlbJ2l4Su+/hrZcIOpEIowtqNB37?=
 =?us-ascii?Q?M235sIrBM1pGymxCYSJxmScEfjLMNUeEaDkAAW/uroaI9GwDkIZmm8EN2qWh?=
 =?us-ascii?Q?9oGk5iNaAHGWnH5qIfQ9DFpZjgADFvwPWZuwPiO7bjDV4CxNQqk5KyW+FPtq?=
 =?us-ascii?Q?GShF1KRRlpGtqOzwU3AlLqRr+NVDuC2W2YLA/8JYIs4yeWdt5NO5NkU375+2?=
 =?us-ascii?Q?yP+PJbKpcscI/wIyzzAmJqQEkCxAUwcvUlLkkpo1+37t2o3Kz9NoVfU3SeEt?=
 =?us-ascii?Q?iqlbhKWkmixXRzyLleUKceHGC8o1YnuFrRpdAskDFbf++D0HOJu8MgxAmlGN?=
 =?us-ascii?Q?GHv//Ivq7g/5ZrImAyxWwPFRBrOFhll0X/4j+hUC4aGzgFZ1oq79YHIlFN/6?=
 =?us-ascii?Q?VdVvUu8eCaBLesSQDjYBL0Tks+RQnKwVA5S44VgZihYZ6gomMsr3hbUhgEwk?=
 =?us-ascii?Q?NC1K8x6X534YmMkyWHhFh/f/6HLBiL7wuH20jUu/J5+AkTGPEfK9q1wgsJHm?=
 =?us-ascii?Q?G8YiVI6TmsklRQVCl7zimu74cGq274swMUr9ZuKr6ac+VcrWfOpqwEo+0L6j?=
 =?us-ascii?Q?kHGZWmfCxLtdPvNeNPO2P7lP3kPK6Lc1aBywLHu8+3rW7B5g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8330dc-7cb5-49ad-dec5-08df464548f2
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:59:10.2124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ff5bXNnNxxP67tEx+vSOil1XaBswKP4PP2T8m2La+TpK+zy/Vl3bZzOgRCB8Fnq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9636

On Thu, Nov 19, 2026 at 07:24:13PM +0800, Xiaoyao Li wrote:
> On 11/3/2026 6:38 AM, Edgecombe, Rick P wrote:
> > On Thu, 2026-10-29 at 09:56 +0000, Duan, Zhenzhong wrote:
> >> After thinking about this further, a second .run() attempt cannot recover
> >> from partial MMIO acceptance with the current implementation. It starts
> >> accepting ranges from the beginning, so it will encounter a re-acceptance
> >> error on the first range successfully accepted by the previous attempt,
> >> before reaching the range that originally failed.
> > 
> > How does MMIO acceptance fail? Whose fault is it?
> 
> According to the Completion Status Codes defined for TDG.TDI.MMIO.ACCEPT in TDX
> Connect ABI spec, it can fail due to various reason. I think most of them are
> the fault of the host, and a few are guest fault.
> 
> The most interesting one is the TDX_OPERAND_BUSY due to contention on some
> locks. E.g., when host is operating on the TDI, it fails to acquire the TDIMT lock.

The host should having locking to prevent this kind of return code
right?

> >> When .run() fails, the device is not accepted for driver attachment, so
> >> there should be no driver MMIO accesses. Therefore, removing the
> >> guest-side MMIO resource entries and freeing the descriptors in
> >> tdx_tdi_mmio_teardown() should be safe. However, this cleanup does not
> >> undo the MMIO acceptance already performed by the TDX module.
> >>
> >> There is no TDG.MMIO.UNACCEPT ABI to roll back those successful
> >> acceptances. Recovery therefore requires unlocking the device through
> >> the UNBIND hypercall, which asks the host to tear down the associated
> >> MMIO mappings, before locking and accepting the device again.
> 
> The UNBIND is invoked by userspace. What if userspace doesn't do it? Do we need
> to harden it that driver attachment will always fail when the TDI is locked but
> not accepted?

Yes, Leon's trust level series should be part of this, ultimately you
can't change to lock unless the trist level is disabled/isolated and
you shouldn't be able to change away from that while the device is not
in unlocked or run.

I haven't seen anyone work on this detail yet though

Jason
