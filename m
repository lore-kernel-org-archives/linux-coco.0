Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC7540BE7
	for <linux-coco@lists.linux.dev>; Mon, 25 Mar 2024 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711372049; cv=none; b=bvWK1NIbXoMOYavdPWRCe/OhpxGFJKMYPHo2E50kw8cPOXz569KgB+qfZeFnhTE3O+tlxktOsVaG4iBEmw4xBRFbksjj3ijMGeYBWpZjsKIPAmEEx2Drnc5kAjpN2iS+oKEhk8hyXw8HYPXbTUCXQAPzelgVZJhKOzSk1MsTIgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711372049; c=relaxed/simple;
	bh=cIy7Sh3rcdVzEL4dLPqzlNpVOIZ4XyHbZYTdcENdzYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scHyUiFG1tiyyHxArBiJYcxi4AxZrWNb/V3XWuBdMj6Q1a6AlGLo7PVUSgfQoPzP7NDgUkwreRQQV1T6z4c13gFLJkRPGMoJ3fZ0wAthV+6H5KxygbuHNvZAYyKNDrdh8G95PnqKg+aALKoQHz60GAJoJxxUyy6RGjWzhbli194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpc7FYoi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpc7FYoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711372048; x=1742908048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cIy7Sh3rcdVzEL4dLPqzlNpVOIZ4XyHbZYTdcENdzYw=;
  b=fpc7FYoilJHUIkelq+lcm+NHVCUMM9Os90ZbAo2hF2TlE4PVXw2lsBJ0
   f0/xPPvUG+5NYy4xpkMboKIb+ZLBnNKldB5Fht3iFtxmdcrbkcN049hpw
   gSPvqMNDA/TuYcAksa5BXhG0Sumeup9cy28VDS5fmnET/vml035KGdyWY
   /9lnqAWUPuVLQA7UdgKtRepE4lfGH4Zz+V88fpWhiVkALGJqAMSzuBx3I
   PYvWUed9EsLXVcivBYTTj/4+Pq5LcH0ngTyhz8lE10kFnG/3Navuz5YZU
   vvpmNE3T0HcXUUddo58mpo8ccPsvyZkhvPwSycHQcykKIR/eoezLIwNYS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10165345"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="10165345"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 06:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="15639830"
Received: from kmreisi-mobl1.ger.corp.intel.com (HELO himmelriiki) ([10.251.212.8])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 06:07:21 -0700
Date: Mon, 25 Mar 2024 15:07:12 +0200
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Yao, Jiewen" <jiewen.yao@intel.com>,
	qinkun Bao <qinkun@google.com>,
	"devel@edk2.groups.io" <devel@edk2.groups.io>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Aktas, Erdem" <erdemaktas@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Peter Gonda <pgonda@google.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Michael Roth <michael.roth@amd.com>
Subject: Re: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for
 coexistance of vTPM and RTMR.
Message-ID: <ZgF3ACjFj8LtUWgv@himmelriiki>
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>

On Fri, Mar 22, 2024 at 07:56:53AM -0700, Dionna Amalie Glaze wrote:
> On Fri, Mar 22, 2024 at 1:52 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Fri, Mar 22, 2024 at 02:39:20AM +0000, Yao, Jiewen wrote:
> > > Please aware that this option will cause potential security risk.
> > >
> > > In case that any the guest component only knows one of vTPM or RTMR,
> > > and only extends one of vTPM or RTMR, but the other one only verifies
> > > the other, then the chain of trust is broken.  This solution is secure
> > > if and only if all guest components aware of coexistence, and can
> > > ensure all measurements are extended to both vTPM and RTMR.  But I am
> > > not sure if all guest components are ready today.
> >
> > As far I know (it's been a while I looked at those patches) shim.efi and
> > grub.efi have support for EFI_CC_MEASUREMENT_PROTOCOL, but use the same
> > logic we have in DxeTpm2MeasureBootLib, i.e. they will not measure to
> > both RTMR and vTPM.
> 
> Shim will measure into CC and then continue to measure into TPM
> https://github.com/rhboot/shim/blob/126a07ebc30bbd203b6966465b058da741b2654b/tpm.c#L164
> 
> GRUB2 has the same behavior. We can at least get coexistence
> supporting the current boot integrity strategy that Confidential Space
> is using, which is to depend on a dmverity initramfs whose root hash
> is in the kernel_cmdline, and a Linux kernel built with LOADPIN. The
> changes to Linux are proposed but not accepted precisely due to this
> conversation we're having now.
> I recall describing this to another CSP engineer at an IETF meeting
> and they claimed they used the same approach, but I can't remember if
> that was Oracle or another company.
> 
> >
> > Looking at systemd-boot I see it will likewise not measure to both RTMR
> > and vTPM, but with reversed priority (use vTPM not RTMR in case both are
> > present).
> >
> 
> Interesting. Thanks for this report. We'll push for the changed
> semantics here if the spec is indeed changed, and request partner
> distros in the CCC to include the updated systemd-boot.

FWIW, my RTMRs patch to systemd was merged quite recently so it's not
included in any systemd release yet. (It was mainly implemented for the
UKI case that allows TDVF to boot a UKI image directly and then have the
image sections measured separately.)

> I think that since the current boot integrity story stops at PCR9, we
> have time to update this component before the attestation method
> evolves to support a less special-purpose system composition.
> 
> > Linux kernel appears to not have EFI_CC_MEASUREMENT_PROTOCOL support.
> >

Since 6.9-rc1 we have it: ac93cbfc

> > > Since this option caused a potential risk / misuse breaking the chain
> > > of trust, I recommend we have at least one more company to endorse the
> > > runtime co-existence of vTPM and RTMR.  Also, I would like to hear the
> > > opinions from other companies.
> >
> > Rumors say intel is working on coconut-svsm support for tdx.  That will
> > most likely allow to use a vTPM with tdx even without depending on the
> > virtualization host or cloud hyperscaler providing one.  We will see VMs
> > with both RTMR and vTPM and surely need a strategy how guests should
> > deal with that situation, consistent across the whole boot stack and
> > not every component doing something different.
> >
> 
> An ephemeral TPM that Coconut-svsm offers is qualitatively different
> than the persistent TPMs in CSPs today. Users of Confidential VMs all
> have different threat models that allow for trusting a CSP-managed
> vTPM for sealing keys but not for trusting unencrypted data in use.
> The boot stack attestation story will not be fully resolved for a long
> while, and a smooth transition is better than a jarring one.
> 
> > Given that the vTPM might be provided by the hypervisor and thus not be
> > part of the TCB I can see that guests might want use both vTPM and RTMR.
> > So, yes, for that case coexistance makes sense.  I'm not convinced it is
> > a good idea to make that a compile time option though.  That will not
> > help to promote a consistent story ...
> >
> 
> I agree, but it does mean we have to change the event log composition
> to describe the configured measurement services like described above.
> I think a static Pcd is okay to begin with. The idea for tracking
> these qualities is through software supply chain endorsements.
> Eventually that would look like the proposed in-toto's SCAI [1] but
> until then we'd have a bespoke format that we document and integrate
> with in an attestation verification service.
> 
> [1] https://arxiv.org/pdf/2210.05813.pdf

-- Regards, Mikko
