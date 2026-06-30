Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325C41DC1AB
	for <linux-coco@lists.linux.dev>; Tue, 30 Jun 2026 00:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782780127; cv=none; b=i0ZxMT/CVOFwEvYbRYOFPpHvp9ShWsX6JpjJzslsgoGJPiWt9UiAbMXI1vo86CkDKCKJU369w3Z1FsKQx/h74GAnlHOqCRSKOPDSl5DPrV05O12lAkV8jH3GBMhbspuRQaDixKfQu9vmJGlBVklzBkEEk3sTlKUm3zLr99ka1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782780127; c=relaxed/simple;
	bh=cshAbN6D5LTzAQCSGrGvu9YTiIKTGytpePf2gXb3rXw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CdAKNVUxhkHwaBcY85Xwhm7+lz3N0MFLIUX+hMEVmfv26QmXkdTboRzwXWy+e6VQsrCjXNscyqJ3KHpPoxlWX4G8yIs6XUCnOIZH/ANnRtNXSXQSUSyNHLXHn8x2qw9rW0YuhuwNPy26kj9B2cBVCZnZwDV+G/ywrYyGgtHwmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mtkTf8Tc; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mtkTf8Tc"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so1877407a12.0
        for <linux-coco@lists.linux.dev>; Mon, 29 Jun 2026 17:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782780125; x=1783384925; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Gh6LWY0rzUQKB9FLNPeE5dt4Ox2OdfcTUONU/T6FNY=;
        b=mtkTf8TcBWS2shbOSjFJqrp6VoLDn9B6IlPxlO1ZU2W3W0z0BZi3S+O8UjYyzLJRgS
         wkGit0xK3p5OTh8fbXdlqY/5rs1T8RMCr9dwh+h8hYl7AOvH27pq6fF9RLc2JJpmoky6
         3bhLQZLdgcC+6bgjd8ijcaVPTGE4eI9hpvJkEWFQm6nNrkfDqInSyvIF35oUlaogtbyS
         RFi5iQIkK1l/5aCicSah1nA0H0Vup0lx1cFHHMxIbrdsa7sM9BllFIaIo8Rm5MhAqxN7
         ttAur1VG2KCfnlmrORdGxp4HiJp+ji2rJgxiIr/iaH+zTrvZSIaRnBpj005+hlSxhksS
         RReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782780125; x=1783384925;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Gh6LWY0rzUQKB9FLNPeE5dt4Ox2OdfcTUONU/T6FNY=;
        b=ecretd1qq5gzE+Id5cBN0RBQAInCbg84p5feX8LBtMaWo03n2GX6TeXIAeQ0qh3pDH
         1p/2GI2s0tAgqDxJfszc6ZQyh2KauKirHNXYSbSMS6TCkzQoqySWJCo3yrr/5JzFEpsm
         9nQcR9MR+UK8clITZKppC4NsVmC7A8tbV6xZXVUepjnRIKfQFBrovUkEF8UPymejzV46
         6TxwFL2F6IvV5lKmQVkzyb3o1kZXpdmyD2bgizNtTOwXmLGfSLVQmZsOraV9kUiTgr1x
         ttICzSWMP6QiUfuy84OxDc64RJWTuRud5S6VyN5VTLsJqpgUljF9hgRCHu0nXIq+yjp3
         y3DA==
X-Forwarded-Encrypted: i=1; AFNElJ8HHiX7JBFzWDZGMEjZm512dKb3hFBLBbF73r9uMMRunKlG6TJdPwdnI5omZ3oGt8iZr0DSc9e24ZlV@lists.linux.dev
X-Gm-Message-State: AOJu0YzszZrreMA5fWE2mB1ZzKj2be0c/DPasDVe8UqiaN6NTla0Dzym
	iITabzhfAbUzSHofqNEjB12cOGWVPyNeBLR6Tv9rwcFJj20mMQZZQsHbJSAWQK3IjS1zW/u78mJ
	XHMNUHA==
X-Received: from pgge11.prod.google.com ([2002:a63:db0b:0:b0:c94:ebb:92dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6713:b0:3bf:b3d5:ce2d
 with SMTP id adf61e73a8af0-3bfc50b8944mr1267082637.7.1782780125319; Mon, 29
 Jun 2026 17:42:05 -0700 (PDT)
Date: Mon, 29 Jun 2026 17:42:04 -0700
In-Reply-To: <20260629100301.GA1743876@pedri>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618081355.3253581-1-yilun.xu@linux.intel.com>
 <20260618081355.3253581-17-yilun.xu@linux.intel.com> <aj1tFuwZWdPGfUoG@google.com>
 <20260629100301.GA1743876@pedri>
Message-ID: <akMQ3J6fK3DUBsPH@google.com>
Subject: Re: [PATCH v2 16/17] KVM: TDX: Add in-kernel Quote generation
From: Sean Christopherson <seanjc@google.com>
To: Peter Fang <peter.fang@intel.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, djbw@kernel.org, 
	kas@kernel.org, rick.p.edgecombe@intel.com, yilun.xu@intel.com, 
	xiaoyao.li@intel.com, sohil.mehta@intel.com, adrian.hunter@intel.com, 
	kishen.maloor@intel.com, tony.lindgren@linux.intel.com, 
	baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, dave.hansen@intel.com, 
	dave.hansen@linux.intel.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Jun 29, 2026, Peter Fang wrote:
> On Thu, Jun 25, 2026 at 11:01:58AM -0700, Sean Christopherson wrote:
> > On Thu, Jun 18, 2026, Xu Yilun wrote:
> > > From: Peter Fang <peter.fang@intel.com>
> > > 
> > > Provide an in-kernel path for Quote generation when handling
> > > TDG.VP.VMCALL<GetQuote>, without requiring an exit to userspace.
> > 
> > Why?
> > 
> 
> Hi Sean,
> 
> This is mainly to avoid a round trip to userspace for the GetQuote flow.

Again, why?

> New TDX modules can now get a Quote directly via an "extension SEAMCALL"
> instead of exiting to userspace and using an SGX enclave. Exiting to
> userspace for GetQuote no longer seems worth the overhead/complexity.

I dunno, from a kernel perspective, this is more complexity, not less:

 Documentation/arch/x86/tdx.rst |  19 ++---
 Documentation/virt/kvm/api.rst |   3 +
 arch/x86/include/asm/tdx.h     |   9 +++
 arch/x86/kvm/vmx/tdx.h         |   6 ++
 arch/x86/kvm/vmx/tdx.c         | 135 ++++++++++++++++++++++++++++++++-
 virt/kvm/kvm_main.c            |   1 +
 6 files changed, 163 insertions(+), 10 deletions(-)

> The first half of the series enables extension SEAMCALLs. They implement
> simple APIs for higher-order security protocols that would otherwise need
> to be broken into smaller routines. For Quoting, this allows KVM to get
> a Quote directly through TDH.QUOTE.GET. The TDX module needs only the
> input data from TDG.VP.VMCALL<GetQuote> for that call.

Answering my own question (though probably poorly), IIUC the answer is that
DICE-based quoting is done through the TDX Module, whereas existing quoting is
done through an SGX enclave and so was routed through userspace.

If that's all there is too this, then why is KVM involved?  I.e. why doesn't the
TDX Module provide the quote directly to the guest?
