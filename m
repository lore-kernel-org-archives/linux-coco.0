Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FD61EA92
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSgeuu53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697029671; x=1728565671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KLhN9KgQsZyg0n8Ly1Pb7b8a/0TBjyZmAM7hyIaqDU0=;
  b=aSgeuu53gQ20ODiBjQ88f/DPfDwLLb6AyOa21nmc6xmy/8t5oAhI8vrq
   2stSzL/7wPle/AbxSE60RGy7Q0CiXylNAvcA49coz09PzLszwof+BuTiO
   eabQTBC1eIf7EurZsGsSyW3b7qt6C293HW/1p9LqfsnjgN8o5ZHf7iPpC
   3MjYsDa7MaBfnYlhzOzlMhIuWf599JoLabt7GuCcoXmZ4KMK2zuNntPFP
   qb6+xv7DYbuHoW29q6dJ1C1MlzejfJ0qsLzTyoqq2eRmZhlP3nrOx77N8
   zPk534HHlBkqwWpBCO7447zO7P/EGjOgJ/Pb3j2Qxb/Pe8l8NXd6u/kGk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415703640"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="415703640"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="788987517"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="788987517"
Received: from laptop-dan-intel.ccr.corp.intel.com (HELO box.shutemov.name) ([10.252.56.166])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:07:46 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 0FD8B109FB5; Wed, 11 Oct 2023 16:07:43 +0300 (+03)
Date: Wed, 11 Oct 2023 16:07:43 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/13] kernel/cpu: Add support for declaring CPU hotplug
 not supported
Message-ID: <20231011130743.mdfi27pdwktefbsv@box.shutemov.name>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-3-kirill.shutemov@linux.intel.com>
 <dcf9317e-5557-4fe7-889c-1a02783fa894@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcf9317e-5557-4fe7-889c-1a02783fa894@linux.intel.com>

On Tue, Oct 10, 2023 at 06:35:59AM -0700, Kuppuswamy Sathyanarayanan wrote:
> 
> 
> On 10/5/2023 6:13 AM, Kirill A. Shutemov wrote:
> > The function cpu_hotplug_not_supported() can be called to indicate that
> > CPU hotplug should be disabled. It does not prevent the initial bring up
> > of the CPU, but it stops subsequent offlining.
> > 
> > This function is intended to replace CC_ATTR_HOTPLUG_DISABLED.
> > 
> 
> Looks good to me.
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Thanks.

> > @@ -543,6 +546,18 @@ static void lockdep_release_cpus_lock(void)
> >  	rwsem_release(&cpu_hotplug_lock.dep_map, _THIS_IP_);
> >  }
> >  
> > +/*
> > + * Declare CPU hotplug not supported.
> > + *
> > + * It doesn't prevent initial bring up of the CPU, but stops offlining.
> > + */
> > +void cpu_hotplug_not_supported(void)
> > +{
> > +	cpu_maps_update_begin();
> > +	cpu_hotplug_supported = false;
> > +	cpu_maps_update_done();
> > +}
> 
> Since this function is not used in this patch, do you need to add __maybe_unused to
> avoid warnings?

Hm? I don't think compiler complains about non-static unused functions. It
has no visibility if it is used.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
