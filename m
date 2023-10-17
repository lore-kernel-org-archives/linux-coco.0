Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EE91FD5
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 04:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1d6thtu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697515650; x=1729051650;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mOi/PxuWGthP5fk2BEwCXpC7fhhfam29lQtAIk3y7II=;
  b=Z1d6thtulFC3D6FxAmsuVNSQZyAij2kJDRuXa7Oqm4o6Yj3iTt+Fhz/I
   TdTPtbreC7PZT+FNKmPYCqJfYVTaYNc5bVTiWpdOHatTEVUhgIUAvxuuN
   jWlrpCOWevaovxVXNkgDNOUESV3cJ0zk1iaOIoN/Rnj3kBqv+t38tPWDa
   00F1bgSIgutm35NcOD/LZYec+3ssRiASkTyH6pkJQMAcd7TTcBAWwBY7V
   Ksg8w+K5KVdYzhF+VLW4UVw49XkgrrD5XiB0WDBBC5tvr3ZviqQkVRUIR
   yqFM9QlqcE+MBDt5mxLTXXj0o0drr68C7nQAjHi5UDsLeZJBFDeDBR2kd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="471913828"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="471913828"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 21:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="3762785"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2023 21:06:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 21:07:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 21:07:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 21:07:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 21:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvi752bw/oB8qwuZ37AZkPjdnZmE6//BV6tDtAUqXMuoIbnsHMFB33GNvVkNTEXyz0JSzAcvBvAG5fAEiTNpfJrG48CmIfw+eJ/niLx/TgomP7UhGGRbOfMBdnbi7hRoEzUL58SsQ+LOAU/oe7w2kJxX1ubwj+koBDbwUu3cmwSxPJw+XISPAxG6Zz52toH6hFQ52gBMyx9XCYnMZ4NPBVz+MU9Fnzrl/TNcmTBMXfZXYYwt7LRQDgChKI78oJxVqyY+lpxREsiP3xWC3/tDWJiIN+sF5IWUOoOhvkV4u47Ql+g+7p9oIdeeJqV9ipapf723iZq+Gco5Lt5V7UdOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZdBapjJCLZpKPq10zzmWxHPRlxM+PiU9Kgfmg6rZto=;
 b=JKQkmrVi+O3ZCNOZmrP1XcQwGRe29p/slTw2DTTsvY3RSt9YkCQ2W63FTtIfN2EfMxyi15aSW6IKRtGZVGoCGd5wIlqha9ZE7Y6pOf/+28G/6MkHN8yJTJrvq/ZolsigtJhGfoALWzGafQ7IoWGsY1s+qs4sqOpKfAMTFxn5hnYFb75iN0SbbbBK7UvvDolqbGQ3EAYTy9n1gHVPn0O4dDVdEIsowviQdFkw8OY0gMSjjqWgOtjYgAR3Sj6SAoX89A7pwgGsigyyUKfPQx1uu+xudycRmbVMskeqqxe9MYGvIw0DpwQXgDaltsNeuI/T5+Py4WAPdsl1u2+uPMG2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ2PR11MB8346.namprd11.prod.outlook.com (2603:10b6:a03:536::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 04:07:20 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 04:07:13 +0000
Date: Mon, 16 Oct 2023 21:07:11 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alexey Kardashevskiy <aik@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
	Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>,
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, "Kuppuswamy
 Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	<peterz@infradead.org>, <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Message-ID: <652e086f8de7_f879294b0@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
 <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
X-ClientProxiedBy: MW2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:907::25)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ2PR11MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae4d4e4-19e3-4ff0-8065-08dbcec68af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: muiWhCKi8zJrSln2B0ATkwcXQaTztsTfsRzbaOu4YstAWbaZq2C1FqF4DzluOJYEseAuBjQFzN+iBpvRI5lXZFEaL0NdqQlgjuY0CzoylGwYJaxhoWppZO/nJayoyykbbg6XSPiw+H0nWrNv50P4dkA5thOZ53mE3yCCsYt45ITwAY/TcoHtAIG/ncpWnmBROgVqw1t/uFo4NToQsVTkodrk6yFdgMyyGzUPpv0JFHq4xqq9m3wbyCKg+A/OtEKSDMIB3X6zTW2mFHTnO+l+rkGY6juoI583dzxbE+ORxxv3eiab+pGQ5NCBHsqw5wLpvqw/H7mmQjv9smUqDh6+I4v//BKt/sY9zjCY2i/W1jDCUu1gxzPpO2OKlcRiJ2T6ARAlt/1tqOPAFsxPcdCyWJdkG44FHmJv+4MPT+6PjlRJ4P+x4W4eojnpREWPY4Xcm9bX8JjaKRU10kTL5lOIh/SyXrJ/0iJQ1fEoQe74VULUyLc7pfaPGT/YssK073qSK/04/8U2N28z+UNq1kbnNMr50KrRKkTXrAf4wDYaBlo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(110136005)(2906002)(7416002)(41300700001)(6486002)(966005)(478600001)(30864003)(86362001)(66476007)(54906003)(66556008)(53546011)(66946007)(9686003)(6512007)(6506007)(316002)(8936002)(8676002)(82960400001)(26005)(83380400001)(4326008)(5660300002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19JN5sIcFdQgtGwZoJhnfAgAwZ0q/Kfdqar3wG0Rn7DtwVpAPhxAFsOkgRxU?=
 =?us-ascii?Q?6OMtMlpYWHQasb4WHstbS9lhOGdcQq+c2lscFDV0PMeMFUsrlW9nB7mP51uZ?=
 =?us-ascii?Q?JTuG3tvKtjyAXwwble2rGHYpDM8nKkNqjgjv+TCYOKDJIXJJ7VuMDlKt4p0P?=
 =?us-ascii?Q?DTE2N3SH5kxjomvZdRIbtsnsZO3bclgoUEXHz5p4aGRMAkAnAZ2NkHhZ7CNS?=
 =?us-ascii?Q?gfvi6vZgNNc4tIWvFiGcKG24sMPN39nL/6/oty5K8SrKL1AGEW4YrWqOSaP6?=
 =?us-ascii?Q?kiXhTiaMLrulOQitDoRuwXEmEm1vUeikds2xVQhc9/1/vfT0WdPZYrCbdY2c?=
 =?us-ascii?Q?/COET0EbD6/SkQDMtsUB2LYwCcMjJ10oKoHq3tzkMiPgOBSyJu5wDuBRtHMd?=
 =?us-ascii?Q?5bTOps16jc/S2aktb1XKpzzanlUQ7ILh/b13yskQtLNfJ9AWqxROSwS9gais?=
 =?us-ascii?Q?f1ZjlqOtklFyD9FHg4MJujXbqdGiLqwSNyGNGR+E5dGNPhT7dqOdRI/mR4k3?=
 =?us-ascii?Q?bI2AbSb6sGTTSyOt6slvue/YaPz3NvxCacM1hOhlwGbcoKkwcj6j6L8vNUQI?=
 =?us-ascii?Q?ZbN6gqM2B2BgcMfJ0qrQb1aseV/D1NiVpUqby6ZbVawwNv6IddQh3569kkvN?=
 =?us-ascii?Q?JzTPwh7zxTJ2ABYZkBiPWhEcAr8R3yb6eotPIpRBSG30V1bdFegskQI/D5De?=
 =?us-ascii?Q?nT6u2LOczscsuBbjN0UnB9lIXR8GPTjv2Ab+dnfhwQxztLvKHoc+zU2QrvMk?=
 =?us-ascii?Q?P/6ZB1J8h5CJvJJOIe2IzihwZON50J8Lli3pVwzvDpVhzJjV1USjtlOPgIIu?=
 =?us-ascii?Q?rBLdzq086twXMtg1M+IISHWx+D8ndgH3mb0SN7OwSIOs560O6jfHeRMBF+xL?=
 =?us-ascii?Q?z3rtIPrcqfRqloVvKDV7mXk0bVlAZOEzgx8KCVrVCFveLhyAv91dyqBnh2Yq?=
 =?us-ascii?Q?jA0DcHYvbNqR+FK9kZbHgJlkJRA86Nwi8oW00YRn/GdCO//0kZz9N6WDc083?=
 =?us-ascii?Q?w4Hbz5zLcNoffDIxpatC/okxwM/lLiMi0cV5SWWyr612hAcYFpKsCzqVM20F?=
 =?us-ascii?Q?nQVT35SwGeLtRzaJZbX0kiFvmMkH1cJPmIG0oIqpIDuRQ1It8FxgJIXlc33e?=
 =?us-ascii?Q?GP2yFoMai2Kh9G38qN90re5NRMeTdr84Y3V6bfzOOXvjy30GkMikkQqug8cg?=
 =?us-ascii?Q?gNIWAc+5cyvI9eAFMfHujccgKc3ZuXWlmntHE8RLoTr+cLGUgsEQx8Ea4RKu?=
 =?us-ascii?Q?kTZtP7I0nfPbSn4t8kGwHoGSCgZmrhnyBr3CKoHzZhAMEtmpHTnOKckEfovN?=
 =?us-ascii?Q?+0G/LE22NZeTMfuxo76dSnpAUEDByDDLs4ufTJKwhU+lPNn+fOvCFMm5+Ysc?=
 =?us-ascii?Q?19neRPaIPXi/g6QUw3NbwHAPl3zpYqjYKX+lC4l/8hcxfjrB7v7QTg/cB3Vu?=
 =?us-ascii?Q?yt7AaKaa0WIpUiPjVdPNm4okVEhRK0jk5ibazTRkNeXbrUvitLFOANqzNhwa?=
 =?us-ascii?Q?OfUQbvHesrw78DHhHUYliarqVF6B0Lou3LaC60xXeouLSM11RAHMWCqUxJU5?=
 =?us-ascii?Q?uEfQRmurFLGsV+uZoDkezcUctxV1kcvC/j48OIhA89Kr+nRSesEOURYsNwec?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae4d4e4-19e3-4ff0-8065-08dbcec68af2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 04:07:13.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LMZ/w/4GjnRCtX44Q6bwwnwXj8uTzO1UN9yOJUQGXaXPvBDRwAFIh5oL9CiplMeVui3PPpD3aLzVS9QZa/WDon/o04HaSGcPnTdQQSnEV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8346
X-OriginatorOrg: intel.com

Alexey Kardashevskiy wrote:
> On 13/10/23 13:14, Dan Williams wrote:
> > The sevguest driver was a first mover in the confidential computing
> > space. As a first mover that afforded some leeway to build the driver
> > without concern for common infrastructure.
> > 
> > Now that sevguest is no longer a singleton [1] the common operation of
> > building and transmitting attestation report blobs can / should be made
> > common. In this model the so called "TSM-provider" implementations can
> > share a common envelope ABI even if the contents of that envelope remain
> > vendor-specific. When / if the industry agrees on an attestation record
> > format, that definition can also fit in the same ABI. In the meantime
> > the kernel's maintenance burden is reduced and collaboration on the
> > commons is increased.
> > 
> > Convert sevguest to use CONFIG_TSM_REPORTS to retrieve the data that
> > the SNP_GET_EXT_REPORT ioctl produces. An example flow follows for
> > retrieving the report blob via the TSM interface utility,
> > assuming no nonce and VMPL==2:
> > 
> >      report=/sys/kernel/config/tsm/report/report0
> >      mkdir $report
> >      echo 2 > $report/privlevel
> >      dd if=/dev/urandom bs=64 count=1 > $report/inblob
> 
> Is not this one a "nonce"?

No, a nonce would come from the verifier to be mixed with the 64-bytes
that the guest uses to establish a shared secret. In this case this is
just showing the mechanics of the ABI with those security best practices
set aside.

> 
> >      hexdump -C $report/outblob # SNP report
> >      hexdump -C $report/auxblob # cert_table
> >      rmdir $report
> > 
> > Given that the platform implementation is free to return empty
> > certificate data if none is available it lets configfs-tsm be simplified
> > as it only needs to worry about wrapping SNP_GET_EXT_REPORT, and leave
> > SNP_GET_REPORT alone.
> > 
> > The old ioctls can be lazily deprecated, the main motivation of this
> > effort is to stop the proliferation of new ioctls, and to increase
> > cross-vendor collaboration.
> > 
> > Link: http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.com.notmuch [1]
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Tom Lendacky <thomas.lendacky@amd.com>
> > Cc: Dionna Glaze <dionnaglaze@google.com>
> > Cc: Brijesh Singh <brijesh.singh@amd.com>
> > Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
> > Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> >   drivers/virt/coco/sev-guest/Kconfig     |    1
> >   drivers/virt/coco/sev-guest/sev-guest.c |  133 +++++++++++++++++++++++++++++++
> >   2 files changed, 134 insertions(+)
> > 
> > diff --git a/drivers/virt/coco/sev-guest/Kconfig b/drivers/virt/coco/sev-guest/Kconfig
> > index da2d7ca531f0..1cffc72c41cb 100644
> > --- a/drivers/virt/coco/sev-guest/Kconfig
> > +++ b/drivers/virt/coco/sev-guest/Kconfig
> > @@ -5,6 +5,7 @@ config SEV_GUEST
> >   	select CRYPTO
> >   	select CRYPTO_AEAD2
> >   	select CRYPTO_GCM
> > +	select TSM_REPORTS
> >   	help
> >   	  SEV-SNP firmware provides the guest a mechanism to communicate with
> >   	  the PSP without risk from a malicious hypervisor who wishes to read,
> > diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> > index e5f8f115f4af..f3ca083127af 100644
> > --- a/drivers/virt/coco/sev-guest/sev-guest.c
> > +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> > @@ -16,10 +16,12 @@
> >   #include <linux/miscdevice.h>
> >   #include <linux/set_memory.h>
> >   #include <linux/fs.h>
> > +#include <linux/tsm.h>
> >   #include <crypto/aead.h>
> >   #include <linux/scatterlist.h>
> >   #include <linux/psp-sev.h>
> >   #include <linux/sockptr.h>
> > +#include <linux/cleanup.h>
> >   #include <uapi/linux/sev-guest.h>
> >   #include <uapi/linux/psp-sev.h>
> >   
> > @@ -768,6 +770,129 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
> >   	return key;
> >   }
> >   
> > +struct snp_msg_report_resp_hdr {
> > +	u32 status;
> > +	u32 report_size;
> > +	u8 rsvd[24];
> > +};
> > +#define SNP_REPORT_INVALID_PARAM 0x16
> 
> There is one already - SEV_RET_INVALID_PARAM, defined in "Secure 
> Encrypted Virtualization API".

Ok, indeed I took this from Jeremi without checking for other
definitions.

> 
> > +#define SNP_REPORT_INVALID_KEY_SEL 0x27
> 
> This one needs to be defined in include/uapi/linux/psp-sev.h's sev_ret_code.

Ah, ok, will move.

> 
> > +
> > +struct snp_msg_cert_entry {
> > +	unsigned char guid[16];
> > +	u32 offset;
> > +	u32 length;
> > +};
> > +
> > +static int sev_report_new(struct tsm_report *report, void *data)
> > +{
> > +	static const struct snp_msg_cert_entry zero_ent = { 0 };
> > +	struct snp_msg_cert_entry *cert_table;
> > +	struct tsm_desc *desc = &report->desc;
> > +	struct snp_guest_dev *snp_dev = data;
> > +	struct snp_msg_report_resp_hdr hdr;
> > +	const int report_size = SZ_4K;
> > +	const int ext_size = SEV_FW_BLOB_MAX_SIZE;
> 
> These two are size_t. Or u32. "int" is just weird :)

Nothing is bigger than a few kb here, but ok.

> 
> > +	int ret, size = report_size + ext_size;
> > +	u32 certs_size, i;
> 
> @certs_size is size_t (as it is copied to ->auxblob_len in the end), and 
> @size is size_t as well.
> 
> @i is just "unsigned", can be declared right in the "for" below?

ok.

> 
> > +
> > +	if (desc->inblob_len != 64)
> 
> 64 is either ext_req.data.user_data or TSM_INBLOB_MAX really.
> May be even BUILD_BUG_ON(TSM_INBLOB_MAX != sizeof(ext_req.data.user_data)) ?
> 
> > +		return -EINVAL;
> > +
> > +	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
> 
> I did not realize declaring variables in a middle of a scope is allowed 
> now :)

Yes, it's been allowed in loop declaration for a few kernels now and the
new __free() helper in cleanup.h will make this model more prominent. My
sense is that it is still not open season on mid-function declarations,
but __attribute__((__cleanup__())) usage needs it.

> Since you are doing this, move zero_ent below. Or, better, use 
> guid_is_null().

guid_is_null() is not techinically enough given the specification
mandates that the entire entry is zero.


> > +	if (!buf)
> > +		return -ENOMEM;
> > +
> > +	guard(mutex)(&snp_cmd_mutex);
> > +
> > +	/* Check if the VMPCK is not empty */
> > +	if (is_vmpck_empty(snp_dev)) {
> > +		dev_err_ratelimited(snp_dev->dev, "VMPCK is disabled\n");
> > +		return -ENOTTY;
> > +	}
> > +
> > +	cert_table = buf + report_size;
> > +	struct snp_ext_report_req ext_req = {
> > +		.data = { .vmpl = desc->privlevel },
> > +		.certs_address = (__u64)cert_table,
> > +		.certs_len = ext_size,
> > +	};
> > +	memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
> > +
> > +	struct snp_guest_request_ioctl input = {
> > +		.msg_version = 1,
> > +		.req_data = (__u64)&ext_req,
> > +		.resp_data = (__u64)buf,
> > +		.exitinfo2 = 0xff,
> 
> Not sure we need this line with 0xff.
> 
> The GHCB spec says the hypervisor sets it, not the guest. And I could 
> not figure out why exactly snp_guest_ioctl() does "input.exitinfo2 = 
> 0xff", my best guest it is to catch GHCB not being called before copying 
> memory to user.

It does mostly seem that way, but given this is plumbed deep into
handle_guest_request() I figure might as well keep common semantics.

> > +	};
> > +	struct snp_req_resp io = {
> > +		.req_data = KERNEL_SOCKPTR(&ext_req),
> > +		.resp_data = KERNEL_SOCKPTR(buf),
> > +	};
> > +
> > +	ret = get_ext_report(snp_dev, &input, &io);
> > +
> 
> Unnecessary empty line.

ok.

> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	memcpy(&hdr, buf, sizeof(hdr));
> > +	if (hdr.status == SNP_REPORT_INVALID_PARAM)
> > +		return -EINVAL;
> > +	if (hdr.status == SNP_REPORT_INVALID_KEY_SEL)
> > +		return -EINVAL;
> > +	if (hdr.status)
> > +		return -ENXIO;
> > +	if ((hdr.report_size + sizeof(hdr)) > report_size)
> > +		return -ENOMEM;
> > +
> > +	void *rbuf __free(kvfree) = kvzalloc(hdr.report_size, GFP_KERNEL);
> > +	if (!rbuf)
> > +		return -ENOMEM;
> > +
> > +	memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
> > +	report->outblob = no_free_ptr(rbuf);
> > +	report->outblob_len = hdr.report_size;
> > +
> > +	certs_size = 0;
> > +	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
> > +		if (memcmp(&cert_table[i], &zero_ent, sizeof(zero_ent)) == 0)
> > +			break;
> > +		certs_size = max(certs_size, cert_table[i].offset + cert_table[i].length);
> > +	}
> > +
> > +	/* No certs to report */
> > +	if (!certs_size)
> 
> Nit: WARN_ON_ONCE(i) here?

Seems harsh for what could only be a firmware bug, panic_on_warn users
would not appreciate crashing the kernel over something recoverable like
this.

> 
> > +		return 0;
> > +
> > +	/*
> > +	 * cert_table reports more data than fits in ext_size the
> > +	 * userspace cert_table walker can decide what happens next,
> > +	 * truncate the output
> > +	 */
> > +	if (certs_size > ext_size)
> > +		certs_size = ext_size;
> 
> This sounds more like the HV provided a broken table with offset(s) 
> ouside of the certs buffer. The HV is expected instead return 
> SW_EXITINFO2=0x0000000100000000 and RBX=requred_pages_number, and the 
> guest to retry.

The existence of SEV_FW_BLOB_MAX_SIZE suggests the driver is not
prepared to retry. Retry support would be a follow-on new capability.

> > +
> > +	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
> > +	if (!cbuf)
> > +		return -ENOMEM;
> 
> In a such (unlikely) event the function returns an error but does not 
> free report->outblob which is going to leak if consequent call succeded. 
> This new no_free_ptr business is confusing at times :(

If this fails it results in the attribute read failing and
read_generation does not advance. The next read attempt will free the
partially completed report and retry, or the driver gets unloaded and
the partially completed report is freed at that time.

> 
> 
> > +
> > +	memcpy(cbuf, cert_table, certs_size);
> > +	report->auxblob = no_free_ptr(cbuf);
> > +	report->auxblob_len = certs_size;
> 
> 
> Aaaand, it works, so:
> 
> Tested-by: Alexey Kardashevskiy <aik@amd.com>

Thanks!

Did you happen to test @auxblob population? I was not able to test that
path on the hardware I tried.
