Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253B22F0C58
	for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 20:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760389165; cv=none; b=W38cZR3D155k+koj8GFY0A9X/Z1Q/RjYEIR53M7+AjrC0Zt07O1BLZCC5z79NjgiTrnpZhcRmbKdUgLB3mRm8RGvbCb88azh7+xYUW1Bye4gXygvHL+J1AJWUB5BtuvXXJYYiuPihqGApgaO/pXiP3CHUXTOh6417kdBBKHgmOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760389165; c=relaxed/simple;
	bh=V0o0YdnKfawFG0S/LxD4c2ONmIHjSbuWqAGiMW/MfF8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HXTo2varxUZVPIhv2vTIoVpT7FIOTEKeU1U9Iqfe+dCXcrXpzYS4kPxdGNB8bLkYrSNB2IZGMoFHaKLVPPLIZl4buABSP97rn3j8jKgfmHQPZ6KQCDtERfh3JHxp+d/r5spQY6Gr7f5KOF488IqCMaBDQdUBJr/VsnRPvDY7wbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TSrjqONN; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TSrjqONN"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so13611518a91.2
        for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 13:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760389162; x=1760993962; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rsLbcQxnVzBTofG5buFKjSgLgx+LWk9MVyYKn5hZEiw=;
        b=TSrjqONNXMd3NgZkp1xfW7AlKreYn2+50+J1KtKYabvtx59i+9nbHQ6gfrZQzPsIHp
         oQw3bSpXKsI83hlPrgS908wyjBVbWC1TmD1NA8m6Uw/q5hJw3zKCk1q+QffDIUhCoQPi
         fkstAU/2VuWvlWsnKDFnJBbOn8mNKwkRGe69v1O6OpPeMd6MMn4+5VI69uAuK2f5B7v/
         cc1YkxL8RvD82VoKyBWxE+3TEpDwbBUv9JpmBV+aqajh8WfX4f/4ATIKL1m7yhGQ1eOF
         +VEI6iQ9NANKp1XxfbPnBz7wiDNkp7RJx10ykC4HJvl9bNPmtEu5BC/mxPuN69FbHy2c
         zZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760389162; x=1760993962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rsLbcQxnVzBTofG5buFKjSgLgx+LWk9MVyYKn5hZEiw=;
        b=jdWguHwe3QuvA+KsRYIWqX802r4au+yIZP0g+Ja7Q+benOzBMwkGXNSkMI8OZjO4Yg
         kuPVkMtm8UoLa1/5VmPwQLeewYDors+xmYucaBITtBBvGUblKbuDVWdjgMqtI7uu/iy/
         XBWXyT5j9WVBPD7OQqmXgiEySVqXVqPLqKHCbRRM6pR1JvKpMcnGAC0Qv6RpX3YXCh//
         m/h8/g5mvpUbfM2h2WgHYgr4IfyaejAu/MZnLbdpVtpJlvPpdalg+4vL4rVezEDRXTWY
         xMSpEsIW9AfTcSVxs/yjiMW80oVHhiCEFgrddFAfgZl0qQoS9B6gahGa1iWWhj1Aew+E
         z7ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVBuux37gBgIGWJBDDPNH43NQwx6LU8b1zquWXgT5jtM4EFsNuiGBc6VZ9Bc5ik6+FTVb4ywxy+/uOr@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0T53qaTDNMtH8DLW3MK0jIA4UhH6t7039rTRx7XleIDfKeicX
	VOhaj/6FG5tNYRTJI8H/m7Y/tnzBGRquk8EjkvDa7DSvAGKq0phzY2QIBu4o4w9mQ4qW0O09RoM
	VIsX4YQ==
X-Google-Smtp-Source: AGHT+IH3W7hslsSg1ZfruAgSMSPE57JiY/2SS4XyoAzw59MpeXjInd8g5McNYn7d63ASeoC/WcTr2wqSW2U=
X-Received: from pjyu10.prod.google.com ([2002:a17:90a:e00a:b0:330:793a:2e77])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38ce:b0:32e:23fe:fa51
 with SMTP id 98e67ed59e1d1-33b511188e7mr30269535a91.9.1760389162357; Mon, 13
 Oct 2025 13:59:22 -0700 (PDT)
Date: Mon, 13 Oct 2025 13:59:21 -0700
In-Reply-To: <ffc9e29aa6b9175bde23a522409a731d5de5f169.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010220403.987927-1-seanjc@google.com> <20251010220403.987927-4-seanjc@google.com>
 <ffc9e29aa6b9175bde23a522409a731d5de5f169.camel@intel.com>
Message-ID: <aO1oKWbjeswQ-wZO@google.com>
Subject: Re: [RFC PATCH 3/4] KVM: x86/tdx: Do VMXON and TDX-Module
 initialization during tdx_init()
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "bp@alien8.de" <bp@alien8.de>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan J Williams <dan.j.williams@intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "xin@zytor.com" <xin@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 13, 2025, Rick P Edgecombe wrote:
> On Fri, 2025-10-10 at 15:04 -0700, Sean Christopherson wrote:
> > @@ -3524,34 +3453,31 @@ static int __init __tdx_bringup(void)
> >  	if (td_conf->max_vcpus_per_td < num_present_cpus()) {
> >  		pr_err("Disable TDX: MAX_VCPU_PER_TD (%u) smaller than number of logical CPUs (%u).\n",
> >  				td_conf->max_vcpus_per_td, num_present_cpus());
> > -		goto get_sysinfo_err;
> > +		return -EINVAL;
> >  	}
> >  
> >  	if (misc_cg_set_capacity(MISC_CG_RES_TDX, tdx_get_nr_guest_keyids()))
> > -		goto get_sysinfo_err;
> > +		return -EINVAL;
> >  
> >  	/*
> > -	 * Leave hardware virtualization enabled after TDX is enabled
> > -	 * successfully.  TDX CPU hotplug depends on this.
> > +	 * TDX-specific cpuhp callback to disallow offlining the last CPU in a
> > +	 * packing while KVM is running one or more TDs.  Reclaiming HKIDs
> > +	 * requires doing PAGE.WBINVD on every package, i.e. offlining all CPUs
> > +	 * of a package would prevent reclaiming the HKID.
> >  	 */
> > +	r = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "kvm/cpu/tdx:online",
> > +			      tdx_online_cpu, tdx_offline_cpu);
> 
> Could pass NULL instead of tdx_online_cpu() and delete this version of
> tdx_online_cpu().

Oh, nice, I didn't realize (or forgot) the startup call is optional.
 
> Also could remove the error handling too.

No.  Partly on prinicple, but also because CPUHP_AP_ONLINE_DYN can fail if the
kernel runs out of dynamic entries (currently limited to 40).  The kernel WARNs
if it runs out of entries, but KVM should still do the right thing.

> Also, can we name the two tdx_offline_cpu()'s differently? This one is all about
> keyid's being in use. tdx_hkid_offline_cpu()?

Ya.  And change the description to "kvm/cpu/tdx:hkid_packages"?  Or something
like that.

> > +	if (r < 0)
> > +		goto err_cpuhup;
> > +
> > +	tdx_cpuhp_state = r;
> >  	return 0;
> >  
> > -get_sysinfo_err:
> > -	__tdx_cleanup();
> > -tdx_bringup_err:
> > -	kvm_disable_virtualization();
> > +err_cpuhup:
> > +	misc_cg_set_capacity(MISC_CG_RES_TDX, 0);
> >  	return r;
> >  }
> >  
> > -void tdx_cleanup(void)
> > -{
> > -	if (enable_tdx) {
> > -		misc_cg_set_capacity(MISC_CG_RES_TDX, 0);
> > -		__tdx_cleanup();
> > -		kvm_disable_virtualization();
> > -	}
> > -}
> > -
> >  int __init tdx_bringup(void)
> >  {
> >  	int r, i;
> > @@ -3563,6 +3489,16 @@ int __init tdx_bringup(void)
> >  	if (!enable_tdx)
> >  		return 0;
> >  
> > +	if (!cpu_feature_enabled(X86_FEATURE_TDX_HOST_PLATFORM)) {
> > +		pr_err("TDX not supported by the host platform\n");
> > +		goto success_disable_tdx;
> > +	}
> > +
> > +	if (!cpu_feature_enabled(X86_FEATURE_OSXSAVE)) {
> > +		pr_err("OSXSAVE is required for TDX\n");
> > +		return -EINVAL;
> 
> Why change this condition from goto success_disable_tdx?

Ah, a copy+paste goof.  I originally moved the code to tdx_enable(), then realized
it as checking OSXSAVE, not XSAVE, and so needed to be done later in boot.  When
I copied it back to KVM, I forgot to restore the goto.

> >  	r = __tdx_bringup();
> > -	if (r) {
> > -		/*
> > -		 * Disable TDX only but don't fail to load module if the TDX
> > -		 * module could not be loaded.  No need to print message saying
> > -		 * "module is not loaded" because it was printed when the first
> > -		 * SEAMCALL failed.  Don't bother unwinding the S-EPT hooks or
> > -		 * vm_size, as kvm_x86_ops have already been finalized (and are
> > -		 * intentionally not exported).  The S-EPT code is unreachable,
> > -		 * and allocating a few more bytes per VM in a should-be-rare
> > -		 * failure scenario is a non-issue.
> > -		 */
> > -		if (r == -ENODEV)
> > -			goto success_disable_tdx;
> > -
> > +	if (r)
> >  		enable_tdx = 0;
> > -	}
> >  
> 
> I think the previous discussion was that there should be a probe and enable
> step. We could not fail KVM init if TDX is not supported (probe), but not try to
> cleanly handle any other unexpected error (fail enabled).
> 
> The existing code mostly has the "probe" type checks in tdx_bringup(), and the
> "enable" type checks in __tdx_bringup(). But now the gutted __tdx_bringup() is
> very probe-y. Ideally we could separate these into named "install" and "probe"
> functions. I don't know if this would be good to do this as part of this series
> or later though.
> 
> >  	return r;
> >  
> > 
> > 
> 
> [snip]
> 
> >  
> >  /*
> >   * Add a memory region as a TDX memory block.  The caller must make sure
> >   * all memory regions are added in address ascending order and don't
> >   * overlap.
> >   */
> > -static int add_tdx_memblock(struct list_head *tmb_list, unsigned long start_pfn,
> > -			    unsigned long end_pfn, int nid)
> > +static __init int add_tdx_memblock(struct list_head *tmb_list,
> > +				   unsigned long start_pfn,
> > +				   unsigned long end_pfn, int nid)
> 
> One easy thing to break this up would be to do this __init adjustments in a
> follow on patch.

Ya, for sure. 
