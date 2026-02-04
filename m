Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F0241324E
	for <linux-coco@lists.linux.dev>; Wed,  4 Feb 2026 14:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215942; cv=none; b=Kb0m8J4kp2/M2yrHhjlgXvNe6K2EoPXLrgm9cn4lFxnbJxUP1CxoJKslfx203SuUTlO2dGByAO3bMDJpbbdrFKS4QUeK4DlZcQJrnhjcO0KN0O2LuS/ns7TEfojCsBD1qAFtvpdUQyjx+VFWrcTtmkC/49N4zlUyJ6+DzJVeAa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215942; c=relaxed/simple;
	bh=evs4o3kg+1XkxWgnNZ9BFDrK2Lk1BY8Wj9Pc3qa5Brw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qAf/du9aLxJHyar7eS8jCKUIQO5D1MCheJ/hX73cy7jP/Ycb6xmw/gXcSj0F7xwcsmrUpEP7HlkLEsAyBTHUSgBnBVASPRyx9HYklYxJakaQhCINmX5Kh5vuqGEpoi7RJWGlgSUhwl4guTUfX7MSB4KSFnjniVI2XL+I9fbSV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c6bzB2Un; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c6bzB2Un"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34c48a76e75so6182236a91.1
        for <linux-coco@lists.linux.dev>; Wed, 04 Feb 2026 06:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770215941; x=1770820741; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc4qlJ2XppRbMaP7K1epexO5oOZyS10mutkmgFd7v4E=;
        b=c6bzB2Unek9Ko3P8rsor4VpjghKq8Kd4eE7xrvaELYmynixdEfESsYz2vECGZMHV8G
         Yh4It1MrhJQv4XlWjmmReiOY4IUrEadmcX8uhp+woAJN0S2K0xgcS/uqI7JXNUJKDOyz
         0qZNeEKLgtIaCh2Mus78RCpl8wibbqDYmC79Kte51P214fOzivNiUv8C9I6SStMG1P+9
         EIEkQ7hryYudv2U7zfVSp9jzAhczrw1D9bcb3WXg5L15FxwRsqJm+mVbPPAp/RS5QFul
         Rn74ECS3Hep26gUllshkli47maz2zM5i8TMOzs4LMK+cuUesEo1uxG94y21DpKgX0aCQ
         yMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215941; x=1770820741;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc4qlJ2XppRbMaP7K1epexO5oOZyS10mutkmgFd7v4E=;
        b=D8EvvaQyyiAWp7G317j6PQfl2rNBRSV4hUAoBzd6sIDo78akHzXeIjBNcN8BjlsaAW
         QWw7OEhI6NM0N2ZHNnWL6UzVOv2WV3X0qzGhwTHOmjss4Yd5GPxu8fBiVao/H3BGx04O
         UXACfNoTH09VuqKAQfrmcEHoIwm7uRX/a4QcBWotbLirU88zlKbk+p4j0qxN0BN/G5zb
         rCgHxsyGWv62gN/Pf+GCr2p6bpXQRDVNdIFNYHlqKaALt2XoCXXVz76ry9iOt0NuHTg6
         57yFMXogUCp2uowqCC8GSzTEx9EX2gZJ1ECRBC2MFd4zgUxLohYWTAr2wQvLRwni0oyx
         JplA==
X-Forwarded-Encrypted: i=1; AJvYcCU5SpKZl9T86tAeCcIWitSp2ui3ZHxkUUK9GualbBlSDXVNeQ5zoXC0zCkTsRWmEFSkOCKBSUppKCD1@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3Pd0oPF1RcwLphKB8eK7b/03YD63rzWmxeTASB4FVtbBS4UUg
	0lES/22BcmffOkiJtDpicafMMCUuZWbuTJDN76lT7LIUnXGi77tSCNSZdU2W8n5bpquya8jOmXD
	irp7QVg==
X-Received: from pjne5.prod.google.com ([2002:a17:90a:8185:b0:352:f654:c302])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3886:b0:352:de8c:7270
 with SMTP id 98e67ed59e1d1-354870d71c6mr2540076a91.9.1770215941201; Wed, 04
 Feb 2026 06:39:01 -0800 (PST)
Date: Wed, 4 Feb 2026 06:38:59 -0800
In-Reply-To: <aXuVR0kq_K1TYwlR@char.us.oracle.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <aXuVR0kq_K1TYwlR@char.us.oracle.com>
Message-ID: <aYNaA7Td23xKHoHK@google.com>
Subject: Re: [RFC PATCH v5 00/45] TDX: Dynamic PAMT + S-EPT Hugepage
From: Sean Christopherson <seanjc@google.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Sagi Shahar <sagis@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 29, 2026, Konrad Rzeszutek Wilk wrote:
> On Wed, Jan 28, 2026 at 05:14:32PM -0800, Sean Christopherson wrote:
> > This is a combined series of Dynamic PAMT (from Rick), and S-EPT hugepage
> > support (from Yan).  Except for some last minute tweaks to the DPAMT array
> > args stuff, a version of this based on a Google-internal kernel has been
> > moderately well tested (thanks Vishal!).  But overall it's still firmly RFC
> > as I have deliberately NOT addressed others feedback from v4 of DPAMT and v3
> 
> What does PAMT stand for? Is there a design document somewhere?
> 
> > of S-EPT hugepage (mostly lack of cycles), and there's at least one patch in
> > here that shouldn't be merged as-is (the quick-and-dirty switch from struct
> > page to raw pfns).
> > 
> > My immediate goal is to solidify the designs for DPAMT and S-EPT hugepage.
> > Given the substantial design changes I am proposing, posting an end-to-end
> > RFC seemed like a much better method than trying to communicate my thoughts
> > piecemeal.
> > 
> > As for landing these series, I think the fastest overall approach would be
> > to land patches 1-4 asap (tangentially related cleanups and fixes), agree
> 
> Should they be split out as non-RFC then?

Yeah, I'll do that soonish.  I posted the kitchen sink so that people could
review the entire thing without having to chase down 4+ series/patches.

> > on a design (hopefully), and then hand control back to Rick and Yan to polish
> > their respective series for merge.
> > 
> > I also want to land the VMXON series[*] before DPAMT, because there's a nasty
> > wart where KVM wires up a DPAMT-specific hook even if DPAMT is disabled,
> > because KVM's ordering needs to set the vendor hooks before tdx_sysinfo is
> > ready.  Decoupling VMXON from KVM solves that problem, because it lets the
> > TDX subsystem parse sysinfo before TDX is loaded.
> > 
> > Beyond that dependency, I am comfortable landing both DPAMT and S-EPT hugepage
> > support without any other prereqs, i.e. without an in-tree way to light up
> > the S-EPT hugepage code due to lack of hugepage support in guest_memfd.
> 
> Can there be test-cases? Or simple code posted for QEMU which is the
> tool that 99% of kernel engineers use?

No?  The core limitation is that KVM doesn't yet support hugepages for private
memory.  No amount userspace code can overcome that limitation.

We can and do have tests and VMM support, but it's all out-of-tree (for now).
All I'm saying here is that I'm ok landing the S-EPT hugepage code in advance of
guest_memfd hugepage support, e.g. so that we don't end up in a stalemate due to
cyclical dependecies, or one big megaseries.
