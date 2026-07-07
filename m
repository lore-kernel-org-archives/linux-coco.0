Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CDB2F6911
	for <linux-coco@lists.linux.dev>; Tue,  7 Jul 2026 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435621; cv=none; b=Ibgbnx1l0Hrh9EA6DktzbS5jfJOwkt/x38HnMjDsOI4h3GdkquyDKpFp0qqGBAIKcW36LXYeKEyFrndxitDNPLp/x4/KJOzsHue6mBna6QPwhtBv+fwFTd7VgFD8jOnpnF/cXExxfIC8mu9iVcOim8XiblELVCnZqRPesS7ztD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435621; c=relaxed/simple;
	bh=dbEhWFYQcuKtmA70mOptSUK8mT123phz+xATTayPUfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dOipWTw7qRZWmTwgqLbkmfO/MkXVW9w3rGiOq7cn/ert4+xKxog7heTbvNeT8iDqylnXFbFFjspHYLUqVuICWUCQ6JM9XehiZki5cNgPHh8LmtyUVMfkigllBY4J5VGNiDb37amYlRtBX9kViGd5Yk4/YUJjooI65xP7PfZ4OSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BIYgNQ3i; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BIYgNQ3i"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c80f89b64bso75825865ad.2
        for <linux-coco@lists.linux.dev>; Tue, 07 Jul 2026 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783435618; x=1784040418; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HufNVYu34je8HZzz4w1ytu+7VhpoP+vTfH7cDlFEijc=;
        b=BIYgNQ3iCzF5/cFZUs6AC9Rujz8KUGwsmU+uIjOxtJnuhHh0lNJr+iLS51agYRXPP6
         iwlLjDpXgfIp3IuEFdVSic1B+xToNDVsOtIzcNUJYSyTMX9qiMsOzbeQbofBMEspVIPe
         TiXiomwn1J69OSUonB00oZG7LAfJAKfKwBbb8dooq1PSK/bfc4Ly7tLnKXfZ3Zoe8oMd
         lSrzV4ga1+mVzIaE/+/PrDmtJK4+v8XZ5YWFZVJQm+j+PadiqdaVR50RY6/2WEJGyEfr
         1K6VdGkjZapR3RBX2RbqFNtvPDDj8V4fh0EyCFOF/026hS58wZpnwFLPNHgPPf8YKQeb
         1KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435618; x=1784040418;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HufNVYu34je8HZzz4w1ytu+7VhpoP+vTfH7cDlFEijc=;
        b=Dy33nzkEh4FZ97kQ+2cReaj6zygMpqG8iO56tUj4ZvRvPTn7/NZ2TzakJfkRltnTj5
         VVBku4MDM8TtzQntiKJ57/BuKLhra7ClM1tBsZRbmjrL/TrOFq85UlQU4VVCJ7s7mKxO
         CA4sqVqWK3jHSdV8RHEzlkD5BMDTkxy1o5ayyOfAG7QI3sfCBo67MSv6kIfgL6D4d9eB
         43q9LomSOaBDBV6DEI97jw3Qqji6wH5LnYdV9N+tZ5onCJ7P2Y824UmguWLFem2RI+xJ
         fr0VOvH+qsUb/8i44C97CPCkBkw3LeTEMoVDwShQ9ZLyF/I3SXH818JTxxM+aIqcp8v0
         VldQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYKNQBFjuZwxGG13s/L5PgpP3ziBRpA84Bxr2Z7WTwXlUo7k4eMkCVL9AE6PKh6V/JGvKArOVnAvV8@lists.linux.dev
X-Gm-Message-State: AOJu0YzlKNP15mIcllrCTdJcy+onz8wwXxvbytLckujbrrSfZXTRV4wb
	Rp4yx8fYMCDRYrS/Mjg8+Iaq/pOXWMgas5kaxrBS4YcCUy3FEapKHEOBzA3xM3fgEaepzEpPjIo
	NAwdrDw==
X-Received: from plse11.prod.google.com ([2002:a17:902:b78b:b0:2ca:d667:90e3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:eccb:b0:2c9:b396:1a55
 with SMTP id d9443c01a7336-2ccbe611f6amr53537385ad.12.1783435618181; Tue, 07
 Jul 2026 07:46:58 -0700 (PDT)
Date: Tue, 7 Jul 2026 07:46:57 -0700
In-Reply-To: <akaCzNRGVy5Xr-bG@thinkstation>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701110547.764083-1-kirill@shutemov.name> <20260701110547.764083-3-kirill@shutemov.name>
 <akUrORhAmRur-lHP@google.com> <20260701180033.6e9c07aa@pumpkin> <akaCzNRGVy5Xr-bG@thinkstation>
Message-ID: <ak0RYaft14ku6rEi@google.com>
Subject: Re: [PATCH v5 2/3] x86/insn-eval: Add insn_assign_reg() helper
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: David Laight <david.laight.linux@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Kai Huang <kai.huang@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Dan Williams <djbw@kernel.org>, 
	Borys Tsyrulnikov <tsyrulnikov.borys@gmail.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 02, 2026, Kiryl Shutsemau wrote:
> On Wed, Jul 01, 2026 at 06:00:33PM +0100, David Laight wrote:
> > Or be even more specific and use '& 0xffffffff' rather than a cast.
> > Particularly since the casts of the RHS in the byte/short cases aren't
> > needed at all.
> 
> I'd rather keep the body exactly as KVM has it today.

+1.  My main argument for casting in the 1-byte and 2-byte cases is consistency
above all else, using a mask for the 4-byte case defeats that goal.

> This is now a straight move + rename with no functional change, and the v4
> attempt to rewrite it with arithmetic is precisely what introduced the
> AH/CH/DH/BH clobber Sashiko flagged.  Tidying the casts turns it back into a
> rewrite and diverges from the form KVM has shipped for years.  Feel free to
> submit a separate cleanup on top if you feel strongly.
> 
> Updated patch below; I'll fold it into v6.
> 
> -- >8 --
> Subject: [PATCH] x86/insn-eval: Move assign_register() out of KVM as insn_assign_reg()
> 
> KVM's instruction emulator has a small helper, assign_register(), that
> writes a value into a register following the x86 rules for writes to
> general-purpose registers: an 8- or 16-bit write leaves the rest of the
> register untouched, a 32-bit write zero-extends the result to 64 bits,
> and a 64-bit write replaces the whole register.
> 
> The TDX guest #VE handler needs the same logic for port I/O emulation
> to get 32-bit zero-extension right.  Rather than add a third copy of
> the same switch, move the helper verbatim to <asm/insn-eval.h>, rename
> it to insn_assign_reg(), and route KVM's callers through it.
> 
> Add <asm/insn.h> to the header's includes so it builds standalone in
> callers that have not pulled it in transitively.
> 
> No functional change.
> 
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Cc: stable@vger.kernel.org # prerequisite for the following 32-bit port I/O zero-extension fix
> ---

Acked-by: Sean Christopherson <seanjc@google.com>
