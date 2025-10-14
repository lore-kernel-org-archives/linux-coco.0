Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A771521E0BB
	for <linux-coco@lists.linux.dev>; Tue, 14 Oct 2025 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760448502; cv=none; b=FAgDqAOoCzmoxu8xQ66EnugZvsDtUPFN+T6i+mNznCLxKlBalOp3QubfxL5HbTBnxN32M+mJhLFbZc6i+erQUgvSgaHLYBI7aBggDoUPdm5SnPgxTtU0hiM77v8caPbVAqwS7agHsb2V7akrW9zqNJ4DK65UbH72Nv2g//f1H5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760448502; c=relaxed/simple;
	bh=TORf89kxAPruMWAxwwZpkmqfRfZXSRcqcOCEdZf5Ed4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pj9PIWgmQjxL9aHdt6LQAaKDs5VJvNA0XV3Bj318gZXyP6uVVPSyYZUgnknkGTsRW1rHI79RFrLnl1YRnB9vh4HHVkEiT9DBubxx6KgwYMMXAharirNEg/yCJs7cSb1ulAclDp2nYuQOeO6GBfWD1S9LAOb/HtIn4wwzD5etYVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M7FbMxI6; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M7FbMxI6"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32edda89a37so9209954a91.1
        for <linux-coco@lists.linux.dev>; Tue, 14 Oct 2025 06:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760448500; x=1761053300; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KRjkMfm2bP+2xhdA92yWGD49fzo6BPa0LuWZXvUPrxA=;
        b=M7FbMxI67xyPkBXRvUKz+YcUa5OEF+aojpvuEvq3CqAfkmjXHG7B2GlAYZ06cP+RQg
         tpCS+uW3GCxYWfHf5mtkQ6JxoHrwodgOIkXPECVp9TfdB6DAQ2kdpAQMSsHqHKCa8+NW
         2uu+xyhQZLe6aZqU1sYp8rg+na1ilyqpE/w45wrlKmy+dI++9mXnj8Qy+X52IeWmps8S
         nG61Shkest1QMqZf+nh9Jzst4cnZ4rPHsC5BFYnAsnSACavJVmw7nWOKyr9Nw6ckxz5G
         qVieXQvarpBC1qKd2zFYS/lhBVFzFIspe2iDfpIORmc8fWoZWm6sqBEDpz+v5QPcBGf2
         bAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760448500; x=1761053300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KRjkMfm2bP+2xhdA92yWGD49fzo6BPa0LuWZXvUPrxA=;
        b=KS7d82tPDwU/nCPtM3uhW39A55lnJFI0Fh7c0FWOuITbCZyXMrXrWins2ppotmY5bn
         Cn411X07RrEYoYaMojlWBsUEklvyYwRynpUzaXgT46jJdOU0W6x1Lsr49Og82Rq9SNad
         7r1lGne/E9EOPd5vF2XBoDSYJiRt0l5dGYoq2yn6hfnRGFERovpZJIivUb/bpVvJA53e
         MgfMOxa90IteBheygXA3PEh52QN/ELUDto7nE7zik2yxAXJCKNO25mvDKBnAKIctualy
         UJw9TnhnbKYRI07lQho9sScy2Nj05glgSQMc6MDEI8qIcuuC+LNuzYheiv47LujXSzJN
         Awvg==
X-Forwarded-Encrypted: i=1; AJvYcCUFcDhjZIrh2aXr/N5b0A3/Kr+9u5yASxeOIucYA3Flw3WT9kf2e3nA1LL3+urHUSNB9f43BkaeLTJO@lists.linux.dev
X-Gm-Message-State: AOJu0YwCABMo+NKlh5Gr0J4Kddfvk0fmWCuLCpC6nDIAHMJWK6SvwhSw
	vtL0hNQwwOlFywrphCxGMPPI8ZdwWPd5OkJi8CdQEIv85qbVfsBdINlbRiWvIbjtL1F7j5tznue
	FynaMSw==
X-Google-Smtp-Source: AGHT+IGVUDXfEjxHF3D+9yDOYD8dNTWDN/VoE4bMUUCel8CPLfbdjARtih4c5//0jV2kl8OrGxXOC3GTZro=
X-Received: from pjbft23.prod.google.com ([2002:a17:90b:f97:b0:330:7be2:9bdc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c06:b0:339:eff5:ef26
 with SMTP id 98e67ed59e1d1-33b513ced9cmr34861576a91.30.1760448500020; Tue, 14
 Oct 2025 06:28:20 -0700 (PDT)
Date: Tue, 14 Oct 2025 06:28:17 -0700
In-Reply-To: <528d8293-a1a0-4d4f-87a6-e06eff7c559a@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251012071607.17646-1-shivankg@amd.com> <aO0G9Ycu_SlISBih@google.com>
 <aO1CGlKGso4LLtS5@google.com> <528d8293-a1a0-4d4f-87a6-e06eff7c559a@amd.com>
Message-ID: <aO5P8TMihUZZaYX-@google.com>
Subject: Re: [PATCH V3 kvm-x86/gmem 1/2] KVM: guest_memfd: move
 kvm_gmem_get_index() and use in kvm_gmem_prepare_folio()
From: Sean Christopherson <seanjc@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: pbonzini@redhat.com, david@redhat.com, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 14, 2025, Shivank Garg wrote:
> On 10/13/2025 11:46 PM, Sean Christopherson wrote:
> I see you've already merged these changes into kvm-x86/gmem.

Yep.  I need to do testing (not really of these patches, but of other things I've
applied), and then you'll see the "official" thank you mails.

> Should I resend these patches with kvm-x86/next and --base, or is the current
> version sufficient?

Current version is sufficient, thanks!
