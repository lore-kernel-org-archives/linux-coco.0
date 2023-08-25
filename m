Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EECB20E7
	for <linux-coco@lists.linux.dev>; Fri, 25 Aug 2023 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692971340; x=1724507340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1WrrVuaq3qOLP+4Fh4Oo1laXCwKcfJBSq+CqkNCWoQU=;
  b=jZslA38oeSxa2JSHtHtd/DXKh4E52Kgodx+CYM0/HdH2roze/ia9a4Vr
   dtT/Vv+yb2CwR40YaCT8VjvUrF/H6YNpKiGA1CoesLbWc5XhRf8uFAOzd
   Dp6DsusEWIAN5SRUXakrnccwumCuJy6FEfLoeZr//2gh8Yuhr+ixi5i7L
   SKAuLS7IBgRPTKI5Ya/IpWgGahBI/mDLEPe1QxMRW4Rs0zjLIa/g3Nr3W
   sGlr5XAkKrHkipxQz8zc2PEFD5Nlz7NdY8eJn1ELXhoBnNtl3IDhA0kpd
   DBChiDXma68NcPp6lOxAlltJ79VwamO8Un+uDgoOTPOpWnM6M86VhFQwl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359715029"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359715029"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="766959646"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766959646"
Received: from naikshri-mobl7.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.41.113])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:47:49 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 62118109FED; Fri, 25 Aug 2023 16:47:46 +0300 (+03)
Date: Fri, 25 Aug 2023 16:47:46 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] x86/tdx: Mark TSC reliable
Message-ID: <20230825134746.k7hkpa3e7wnsuq7m@box.shutemov.name>
References: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
 <ecc11d54-6aaa-f755-9436-ae15b94fb627@intel.com>
 <20230808200111.nz74tmschph435ri@box>
 <878ra0ck4k.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878ra0ck4k.ffs@tglx>

On Thu, Aug 24, 2023 at 09:31:39PM +0200, Thomas Gleixner wrote:
> On Tue, Aug 08 2023 at 23:01, Kirill A. Shutemov wrote:
> > On Tue, Aug 08, 2023 at 10:13:05AM -0700, Dave Hansen wrote:
> >> On 8/8/23 09:23, Kirill A. Shutemov wrote:
> >> ...
> >> > On the other hand, other clock sources (such as HPET, ACPI timer,
> >> > APIC, etc.) necessitate VM exits to implement, resulting in more 
> >> > fluctuating measurements compared to TSC. Thus, those clock sources
> >> > are not effective for calibrating TSC.
> >> 
> >> Do we need to do anything to _those_ to mark them as slightly stinky?
> >
> > I don't know what the rules here. As far as I can see, all other clock
> > sources relevant for TDX guest have lower rating. I guess we are fine?
> 
> Ideally they are not enumerated in the first place, which prevents the
> kernel from trying.

We can ask QEMU/KVM not to advertise them to TDX guest, but guest has to
protect itself as the VMM is not trusted. And we are back to device
filtering...

> > There's notable exception to the rating order is kvmclock which is higher
> > than tsc.
> 
> Which is silly aside of TDX.
> 
> > It has to be disabled, but it is not clear to me how. This topic
> > is related to how we are going to filter allowed devices/drivers, so I
> > would postpone the decision until we settle on wider filtering schema.
> 
> TDX aside it might be useful to have a mechanism to select TSC over KVM
> clock in general.

Sean, Paolo, any comment on this?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
