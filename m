Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE423644D1
	for <linux-coco@lists.linux.dev>; Fri,  3 Apr 2026 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775229748; cv=none; b=m+z7Wcd9gR5YE2oFju07a0+yZXaEJQA1H1WecMgzuKRiwbwueoq0aABNy0sxHCJ3fp7ut16zfrGYdBtuzxuZZwtm8l0UvcQUTMG1TQ8ERKmu7krlcSRCaZYFfIIpV5EnZvf7iHcrmbTI4TeD1VlSxH+qY3gIx1dUe0ccLzHqYMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775229748; c=relaxed/simple;
	bh=DFBq3w/+92JvVnCUbNwiX8XBReWt3DAvnjGNuqvEFVI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Lc3EVg52cwYBsgJYut025N0aQ1m+lGVb2ZS1gn9Pdh3G1cuBJiBzf07+0bcjmZcfRaoEu7y7eHTHsyI47B8VH03xKQwJ34Japu7SiwwnDzCYgftWsozyqO/6RVxH89rYTsy6hOdrmWwk8HHeEAtc+9oiJM73pu07FmbyvxtJyJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZxZqxfi2; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZxZqxfi2"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so1574471b3a.1
        for <linux-coco@lists.linux.dev>; Fri, 03 Apr 2026 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775229746; x=1775834546; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpqHqNyfK10lqPQLcRaczDLbjeG2pjSQT2XmZnmBEwU=;
        b=ZxZqxfi2vZIJdKkvirB9PpNlJfJ4QImq/nSPgwj2pV62t9fY+UbDiuL9ScFzg97XE/
         f6pPFxx8ph5nXkpabhADgRXarXBV0ZXUbGzJjxkTtXriFjTnlMxF1xHJFIILKBBJ+9XW
         d/hZrwN2kgjspNdnsOctbco/S+tHNZavKk3qy3q1xCTY8SCiTNVWwKuqOk+NnYVFiiyb
         4E3MSXuCm/InpdqxBxnO3DKRqPG4DqooRAS8h5WHDksKyMUN14LCoij6Oaqpn5dg59ZI
         WZc9L2aJ96UOxbVYmQIwKMDjY5hDz0l2pdBoqBooBoITKejWryJbp9SYUiEWecDmpZSy
         +vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775229746; x=1775834546;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpqHqNyfK10lqPQLcRaczDLbjeG2pjSQT2XmZnmBEwU=;
        b=DdPv5nvxnkCxrBAzQVxWWd+MWkWFIpewyQjSZWmR3zjF8qY9Fbr+pjB8hNHrR5n+rr
         EWp6yDaXQfmxQSZ4mbRmiRrEa1EAJetJFHljKhpd5PLovk4EeeB4uJznfJoicjQZerMY
         iPwSuvQHNm+cp0p7TCtN/NIAvkvmK7B8CMUFsHPNZWXHDQYIhGusm/SHZXFYiXWcgo+V
         v4aIhRZavh2fWdmtPtSIxy5/ZowHWgWAzNv7VtabGfvJX8YHOoa1Rc3YZKuwiYDDYgFv
         3WWsrdhVsoU59WsWG8Z6hfgrODLoGZ98HR9QgrLBJInMumNr5ELnEVxkmtCUUa4hgKUR
         yPRg==
X-Forwarded-Encrypted: i=1; AJvYcCVsVVbtCvgBc+87AHMFNcGXgV0zJ3LfyWPlN6/MN9/3fNKttDta5PRSKTaokMS2cEdNkikds76n+bZ+@lists.linux.dev
X-Gm-Message-State: AOJu0Yx//2v9OoB1bAVWA1AIFW+fQIFSLOSH9k/4InaGJ+aU87qHYrgU
	HgmK1siDa2qDuLoKl9raU7/ffW3q98sSY5fM1q1wN8Eg8V3lB2oF7KLC04nPdOuqSpYD+xlhzIw
	kV9YvJg==
X-Received: from pfbfc19.prod.google.com ([2002:a05:6a00:2e13:b0:824:aec2:e5eb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1705:b0:828:d9a1:c5f9
 with SMTP id d2e1a72fcca58-82d0db53ec9mr3313449b3a.33.1775229745970; Fri, 03
 Apr 2026 08:22:25 -0700 (PDT)
Date: Fri, 3 Apr 2026 08:22:24 -0700
In-Reply-To: <20260120203937.1447592-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260120203937.1447592-1-seanjc@google.com>
Message-ID: <ac_bMKD7YGhMwUCf@google.com>
Subject: Re: [PATCH] x86/tdx: Use pg_level in TDX APIs, not the TDX-Module's
 0-based level
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jan 20, 2026, Sean Christopherson wrote:
> Rework the TDX APIs to take the kernel's 1-based pg_level enum, not the
> TDX-Module's 0-based level.  The APIs are _kernel_ APIs, not TDX-Module
> APIs, and the kernel (and KVM) uses "enum pg_level" literally everywhere.
> 
> Using "enum pg_level" eliminates ambiguity when looking at the APIs (it's
> NOT clear that "int level" refers to the TDX-Module's level), and will
> allow for using existing helpers like page_level_size() when support for
> hugepages is added to the S-EPT APIs.
> 
> No functional change intended.
> 
> Cc: Kai Huang <kai.huang@intel.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Cc: Vishal Annapurve <vannapurve@google.com>
> Cc: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

This still applies cleanly, any chance this can be picked up for 7.1 to avoid
prototype conflicts in ongoing work?
