Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0402A38FB6
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 21:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706735573; cv=fail; b=kREhrjjrX/7017Tun8cdeD7eAKflGbggIn7MacU7lBb1IgcLWKeVxDpS3KY25SE61Ejs7HDOOJZqxjcyoDbZUPFVKCat/nV9bSbZJGU0A1H66x5AhYVu08K4bsxxRxg10Jbk3FAZ189UPcrxzZfbDfSX3O5yDSd/9BKiOAxyt20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706735573; c=relaxed/simple;
	bh=6fJsISII8oMojMaViVDkNEG+p4b9hygA10fEhu0RmTo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eUItm0Tgv+ZFUgvqPvI/rqy9hQgsawQz8UTMUkwgecqupFD2qEDzUnTXcq/pftbsjO/LO9O5VLECVNT3HkAj0TZGd1F5LNENg/zvJ80HE2P9VLG+hoIVSsNirOdUxeQO4crENyhn0etDg3YchlxQGqiW69KVVnMYwRRyKJJesgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvGjnCjE; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvGjnCjE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706735572; x=1738271572;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6fJsISII8oMojMaViVDkNEG+p4b9hygA10fEhu0RmTo=;
  b=hvGjnCjED8zhi5gqJroEAdzm70ZVNpFKU0NF8ZpG6fnFpJz4k+YNVWZC
   3nhHXnPe9sIpr2AmrE/tei+r9McVOHNdCAhn6wg/kqp+E8QMShTA5rBpq
   8CAUNNoHdumCu/SG0RQXA2F6VR7Fmyjwh/DVVGK/biPvenYsfBgA2SOHR
   oO89c608YrKD+uZ1CIrksx2fKhZcwZDhh//4dm5x1Uu4Wpz3aVIzOW/JU
   UvbSrOWoILnMFdkZu5T10YwM0prrWS+G2pdK2bdqnoKiIPzoZIWb2P685
   CxMMhTkH4MxmdDI+KRXu/uUhdqqTg0OmrH8g3dBNyCtuBHpXYccGzAj4o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11101012"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="11101012"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 13:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788714455"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="788714455"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jan 2024 13:12:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 13:12:50 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 13:12:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 13:12:50 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 13:12:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ig4F9OJqGF6ROM9Kq2SHL/FQ2v5Lsuh5zIJ9Sye3AyJq4jcwq67E12BHURRd1ymXGF3kzNmomDUWl7v+Y6lmxGw2r3YScR/IO5FPhvlclfmhgvGZvHNMJXxn8sgN3BSso+aBKDaj3I9BClQ1FiCCDrcQUQH0xIPAyo3yPJGeHzYLP5is6i4/paWE3he86LeUInPvJhpHOyoJqEKAxFtO2lipf4PmlLs5WpO8K0wGMg2kjfN8TiMdRYNlS0/eo6bbF1lKx9hkrHH1vOQU4Kfdqb4ZjkeHJfpj238i1MgDnqQIYSGsirTx6h/wsd8Gs5oA+nY35IV4ge8J3gY5+bZJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ur2oiwdKzwWh/Io9KULCdf+r53arbEgUSOonioYsGDw=;
 b=mgq85Hoxt2/zEoe9MIjo4scP+Ar4EPpUVC/p9ldYCHZIAdJhjFESQNEJqdb6tX4nzoXyci4PzOe7xs7OC3RhwNdWLIh1XjsvUIthO9iRuMaLXm53zi0+uhCwfb03awagmMK29vPVwevhKmqKhBx0qyuytsZFaQ8Q4Ms7VKAh6NM4zPf6UOTarMtFGiXsvKC1l4sw1rfUpXoV0lxzibpX0egQli6Z/tsW/l0G0fl5fj6oFZjmvXsUMdKqdhfmf/Cgfaq1CF4IqnEhkKEr9BupFpNGTsZ+Zzwt79mQgCrFsxPHbw0mvQeXBaAPhCwDAzQN8fu/0ZwWlImO51rWF1pQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by LV3PR11MB8675.namprd11.prod.outlook.com (2603:10b6:408:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 21:12:48 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 21:12:47 +0000
Date: Wed, 31 Jan 2024 13:12:45 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, "Kuppuswamy
 Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>
CC: Dan Williams <dan.j.williams@intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>, <linux-coco@lists.linux.dev>, <x86@kernel.org>,
	<dave.hansen@linux.intel.com>, <dionnaglaze@google.com>,
	<dan.middleton@linux.intel.com>
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Message-ID: <65bab7cdc650e_37ad294e1@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
 <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
 <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
 <Zbq04j1Av2znlKIC@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zbq04j1Av2znlKIC@redhat.com>
X-ClientProxiedBy: MW4PR04CA0205.namprd04.prod.outlook.com
 (2603:10b6:303:86::30) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|LV3PR11MB8675:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b6eb3a-c6b4-41c8-cbb7-08dc22a16021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3nYtEZhs8tEfgiilZ4HsqdEU3f0L4EX+b/nFH9jRDqwa213L/f9L78BOOIDzmiTF3eiP9jR6YWM5RqH3iivnnx6VBm92rOZ3LXJHe25V/1yRKSxWBRLinpaIYA2Za0gqwcHE/SHDlFZ4IJ9Q1zwpYKmJX7KxuApbDzkh9wJxNTMWAtlGZcjU31BhIQMdN31CC/f9B/iL+8Gv0ziVn3c/d5ngv1hXTJZX5hAbhqHbt4cipTQ/gNfg79ij1Oinb7io7EfU2VetehXnI9JzokSWkun3ZIR1kzdR4YLaZiK15shoklp75sn0OjeSDOFItFOe9n8CxuX2g4bmj/6drXWU994UBrx3wrPTDruqBiaSr0KWz3zpnJ/OjXUVPN5StGruwkErs18MBCVRaVWUi3yHBkUGRs5Faz3ugDaUfOM4+hUhjd8TbZccIwF/UTzTVskZ/N8ozquftFtu3mvhdOmQzsqtJLtRrxsArG1H1511GkmYcPYG2Hu7Uc+STecS9PsVSZYQC4KlxE6Nx5D/OmAMYFXh4IlnLuoP5ONqFBSYvi4r+0fPxm6iq32+LzkUwMCk1cRYeaVuy5du35a2be8EP6tMR7rqOI96ij2kxJHROnLoNFhvahaHbCFtOEtXgMZ7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(478600001)(5660300002)(6486002)(66946007)(66476007)(66556008)(2906002)(26005)(83380400001)(53546011)(6506007)(4326008)(54906003)(8676002)(316002)(8936002)(9686003)(6512007)(110136005)(966005)(38100700002)(86362001)(82960400001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+eMtn/25k79e3H0k4CiL/UCDfP57942PiBYUuDqe9IL+6ybkYzSONYFXXb?=
 =?iso-8859-1?Q?Pd55vaxfXSXCWonw1vVf66nGZM8c5NbSFDQ1ABqEwcLsXLehJ8HBXBywen?=
 =?iso-8859-1?Q?bpPmrlyjg1Dsf7G4H7AX0ceDVezEy7sdN8qfFZSq1w+BbfRdPHfTwsGLPx?=
 =?iso-8859-1?Q?VxeZtBLI9o+p65nZwcYOVnOidkq5UpRG5baa/7e5i7EI3d0SDk/oWvXX3b?=
 =?iso-8859-1?Q?O5aNEOO/VzCKjebBfVirdzdnNmvcPPqpCyTroOaMV8eHN3NSuiBhmUu4JL?=
 =?iso-8859-1?Q?qe0vL0EeraOZeI+xl2dNMnzCj4sAiVgDl46JbnVCRKVA9cd2j6Dzfq16xS?=
 =?iso-8859-1?Q?EFVZltN57Rj2VF0X6lPDrsUUcqrvoiSdWwPUdEyGtRVZjsZlvJsA2VVeEN?=
 =?iso-8859-1?Q?r2ZG0ty3x8NVfz/JVo0Sf7LyzfMZtTOi0lN+WioiJ/lz+zNO5W5qaz3Nof?=
 =?iso-8859-1?Q?VjlNgwyMcQMvfV67p9e/s79AeiIdodJI/H7Xf1i0vKfL6hNmkpp9M5adUG?=
 =?iso-8859-1?Q?Yv/SrTvDiibmvH3PJRKhcsMNI0hYtBTQAoq/V7n/cawI2Sdg/bHxXn+4AP?=
 =?iso-8859-1?Q?W3SaZhLQW1almtrTZDVpc5YFOBvpp3+koTu5eHBcfwDxgOcPKzpEEqygTf?=
 =?iso-8859-1?Q?YPTk8RCoa2H0fC0AFfncyIgKmaotzlx0b4Yz5rWfYACDxNVdMWVaOzgGTg?=
 =?iso-8859-1?Q?t+KMnnVmjkv2QOVqRv9P35mkYVMaBh36KA/I5nfcOBHNtnL0BL3RPzCjFq?=
 =?iso-8859-1?Q?4n+WD8JqbDno3jYYz1ap4cQMCDhP+0MFe6/lCuo8cFvmUf1qydUFgvail4?=
 =?iso-8859-1?Q?phzKPJ45irtoauS4sC7HlOE3vsvh0sd6kXpuK3D2ad+ZaZX5PqY40gC2OF?=
 =?iso-8859-1?Q?ymxth+vX7u7mxrYeRA/KHITtFzfH+duA+V6OMpmFyeciqGREoZAoEyCjE3?=
 =?iso-8859-1?Q?3VEjWaXLup5KRRKfKnX2JgTkyGqV6xSoZPE7v5OkqSIOrkJepG6vkIToUC?=
 =?iso-8859-1?Q?mR8QLvse0G4rqXFx59GRJa/KswqRPH3Xd0lJ1evwrrcZ+qUpWCAVZcVP3s?=
 =?iso-8859-1?Q?rylVSnsvtMSFPLWkyh0nBZykh7OGqAcf+L8O9tHXNrRtqzf8j3RQgJ111g?=
 =?iso-8859-1?Q?wSlNrA3GuxYANagw20v7PMtKPckamsQOa+3LiG5NLTD7dXuagLZSCNLEmp?=
 =?iso-8859-1?Q?54by1OwTvLlr5eXiAsDKmxcNiA1OXaAfKvQzdmlC4LTBzf0bbBiuscbpSa?=
 =?iso-8859-1?Q?BsNbTunuWL7lvClTp5SbB0ijUHnwjAhj4eOvdD8ABMEhHGMks9eiaL+c67?=
 =?iso-8859-1?Q?NpgKQsImcXidSK59BhzYKANUUDSt/o2lCZrm7c+ZcmanbIYV409vn3YQwr?=
 =?iso-8859-1?Q?zZzR6RljAg/CXm5d1CM7NoQpQWtVyxDEfxYdBBXPJQF5LlRCVs2aHBSShl?=
 =?iso-8859-1?Q?MUrx0WX/vIVcWnc/yWUFqblLRUjGDw8qXvsUc+b4u+uU/o0MgJ7MM4pFED?=
 =?iso-8859-1?Q?UKIXWw2AeOHBTrHTHgKWZJypzcsnbCGS1IMFI+SF6GuI6YheVp/e6wGfJG?=
 =?iso-8859-1?Q?kUkjowrXxF8GSmOdhJ6n64xpXqzjRQauINEFxDecvy4BFOOVpW49pgQnJm?=
 =?iso-8859-1?Q?6ow56iEw3kxM8xu3N3o30OFbugb5wjp1BA26TOdpduxBWh7ByRaUN6sg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b6eb3a-c6b4-41c8-cbb7-08dc22a16021
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 21:12:47.8645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kK3Eu2QT50iA1/4fTQGlhMORH5WxVurtIKaeOEDmZ/l8niWxOrbqKvex5ZhcGUcp88ykyiKZpWEtWWdFJt0hvpoEr+RmuxQQKkA+2fPxpns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8675
X-OriginatorOrg: intel.com

Daniel P. Berrangé wrote:
> On Wed, Jan 31, 2024 at 12:44:46PM -0800, Kuppuswamy Sathyanarayanan wrote:
> > 
> > On 1/31/24 11:50 AM, Dan Williams wrote:
> > > Kuppuswamy Sathyanarayanan wrote:
> > >> + Dan Middleton
> > >>
> > >> Hi Boris,
> > >>
> > >> On 1/24/24 1:38 AM, Nikolay Borisov wrote:
> > >>> IOCTL based interface was the natural choice for interacting with the
> > >>> quote generation machine at a time when there wasn't anything better.
> > >>> Fortunately, now we have a vendor-agnostic, configfs-based one which
> > >>> obviates the need to have the IOCTL-based interface.
> > >>>
> > >>> Gate the relevant code behind a Kconfig option, clearly marking it as
> > >>> deprecated as well as introduce a runtime warning.
> > >>>
> > >>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> > >>> ---
> > >> In the following thread, Dan Middleton raised a point about this interface
> > >> being used for local attestation use cases.
> > >>
> > >> https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a
> > >>
> > >> Currently, the configfs-based ABI does not support the local attestation use cases.
> > > What are local attestation use cases, and what happens if Linux does not
> > > provide a local attestation interface and standardizes on remotely
> > > attestable as the standard?
> > 
> > 
> > Local attestation is used by one TD on the same platform to prove to another TD
> > in the same platform about its identity. It is mainly used in cases where a TD provides
> > some special services required by other TDs. Since they are all in the same platform,
> > there is no need for a 3rd party verifier or Quoting service. It can use the verifiable MAC
> > to check the correctness of the TD.
> 
> As an example of where this might be needed, consider supporting a vTPM in
> TDX. The TPM impl would likely be run in a separate service TD, and need to
> be locally attested by the primary TD, to establish trust in the vTPM.

Service TDs are in active deployment? How does that work? A tenant pays
the fees to host 2 VMs? Is that more economical than just communicating
the remote verifier? Not trying to be argumentative just trying to get
to the root of the question "why Linux must care about local
attestation".
