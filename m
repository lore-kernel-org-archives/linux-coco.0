Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD182F5313
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 20:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772049920; cv=none; b=cb4Ha5CtZ5beMzMxwPJwx3fgqNRpg4SB7Xd3zJjBTdcQHyKUq2kxREuJh5exzrh1TDBSq+nIAu6WOIvT/FbWMnd6V7WkYYjGxC2+QlMn+P7FZYy+dIg2cckuuaRv1HQRMuLLT1RwvPgnyqhPxLn+CVgl8gksLCyzKVLRtVtgPEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772049920; c=relaxed/simple;
	bh=tKRbocRq14DmTJ0Xibmw+KZElUfkj3XNWjkuRruFO5k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I1R/7LKNyK6wAEhugUCfG4gcgXUS6ZZnUanM6zpzDfHiXMLVDp7NUUAv4txIXJYThbEfb+xsXXWGFoffLP5zzh03qVbKlYaMfm9RO5kcqbGnOFkJoodnV8knq9fTtV2Psdp/z7QbA7WWdw+JrW5OK2ytEnUL5PjhaQSD0MDFM3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oV3ySn4N; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oV3ySn4N"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c6e1dab2235so7369a12.3
        for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 12:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772049918; x=1772654718; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=euk6pR55vngbiALkr/Ss6DCVuRl2d4R3J4RSxPrxxr8=;
        b=oV3ySn4NCTXcE+8yFul0alQpGlWP7k4wAT4yVSq1nOcnFkVR76PV5XQ/QTkhak/DqF
         J+2BAK7o21aXMAzKXe9rGyyOceYkA6/5fkRk+u8UhsfkuK8rnbai6TDD0KBUA5dw3XTs
         5yUv7GFfRIX6T1EZp45rLNPQE959diL98tNy9qKHWYudub4BMzq2REsN0jteS0AA1uix
         n0GFnDa/kTlFqeU6wIBpyGwA23TAtsDZItu3F7pxCIVUotU8QlNXzarInAHuqjeihHB9
         oOlrnf2spbqTy01ER5kFZjgqLGQ2vm7Ahl57OV2NcQv+nAKFsPNnq9JaVC4vQeMNfahi
         E0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772049918; x=1772654718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euk6pR55vngbiALkr/Ss6DCVuRl2d4R3J4RSxPrxxr8=;
        b=V6ezp33HJ30r+Pg7SusmQcfq2H+w3as5+Fsn3XVwke8X6hTppCLnZroH1OkNI8hSXi
         mFjW2nu8YRmPaK2Xh30UvbjK5yj3dgzijTEVj7MIFzM+JJUUujQSuvD+fFQ28kCg23Yo
         hgOwydtKfyTACtr8IFldLr0DXXWml8ni8jl5zYV3QgGF5Dqc32k9q25ovtCm/7U5rx4E
         kT20QvL/cq9xdPmwvjFQCYc6ZEZOxyjC6gAW/Ci9ykW4rQ/ZlDIlmeNIDEJDlqSg662Q
         kRBRWuT/LOebT3T953TPBqiki2U79oRNtJSyajAzsMQjSai1nOJgooRJGHuSuQHFZNcq
         rt9g==
X-Forwarded-Encrypted: i=1; AJvYcCVzxm1HSVNVmWt+/HF31fgjRFFpoC2ReZSH4yuX12qiKRfMBGW2rUO/Hqmys/GZz7QyTjUQEcwz2nfW@lists.linux.dev
X-Gm-Message-State: AOJu0YxuJJ8hp3/yixNvhO8IwG371+BGFhI4GxKqni6q3Ggf9ZELh173
	yl9GTxxQ7kDOhQe0yyTVFVJN7RrBguFy0ibYjN1bx6hchsc7gVUzr5sdwmcm1P65xrka8d80od7
	O6E8F9g==
X-Received: from pgbda10.prod.google.com ([2002:a05:6a02:238a:b0:c6e:6f7d:a6d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6083:b0:38e:87d7:7b95
 with SMTP id adf61e73a8af0-39545e91cafmr14346518637.20.1772049917923; Wed, 25
 Feb 2026 12:05:17 -0800 (PST)
Date: Wed, 25 Feb 2026 12:05:16 -0800
In-Reply-To: <d98692e2-d96b-4c36-8089-4bc1e5cc3d57@fortanix.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <d98692e2-d96b-4c36-8089-4bc1e5cc3d57@fortanix.com>
Message-ID: <aZ9V_O5SGGKa-Vdn@google.com>
Subject: Re: [PATCH] KVM: SEV: Track SNP launch state and disallow invalid
 userspace interactions
From: Sean Christopherson <seanjc@google.com>
To: Jethro Beekman <jethro@fortanix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 19, 2026, Jethro Beekman wrote:
> Calling any of the SNP_LAUNCH_ ioctls after SNP_LAUNCH_FINISH results in a
> kernel page fault due to RMP violation. Track SNP launch state and exit early.

What exactly trips the RMP #PF?  A backtrace would be especially helpful for
posterity.

I ask because it's basically impossible to determine if this approach is optimal
without knowing exactly what's going wrong.  Semantically it sounds reasonable,
but ideally KVM would naturally handle userspace stupidity (without exploding).
