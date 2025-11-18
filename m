Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B0132692B
	for <linux-coco@lists.linux.dev>; Tue, 18 Nov 2025 23:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763508517; cv=none; b=UgLuq1tUQeyLFZnH8TPcPtYu86OlttVMtBOUQSLYpEq2NDr6O6CgumVpAEO5XLbAGbiosjGTvDVp53OSm364JjRs2XHTIU5vURayMNjTViqqXJAo2ZaEDil6arCLD6kvFBZE65QlLcI6d2+zmnC+y1i0ShBjJsHfo1y45G7zALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763508517; c=relaxed/simple;
	bh=5gCxM2Y0gj+MPF/RXaCyHLj5HN8gnnfSCAyarkw4HNI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nMO/Q8qHrl15Dka0dunpqPh0Sc9iZjT+p6F8eIK+UNvtXdQ+zS6syFV4aOT6a/T1Gy7Ik3yEmJwq6V/23GPkgZLt+rlOdegqtHIuEbvaxvA6IxI0ZJ696YWgPrbYUXoNWFFov22EusW75SQYX3nc46HTK60L3UgonedpU4RvcJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aMfEwoOD; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aMfEwoOD"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-297f3710070so118661815ad.2
        for <linux-coco@lists.linux.dev>; Tue, 18 Nov 2025 15:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763508515; x=1764113315; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=olNNTUm+BTLFO+ZiwDAf9pAOve+v0FNRwAZ4CxSj/MA=;
        b=aMfEwoODNoWUylt9ICWJre0f2s8BUKTq8HP9D+RpsUdA3rrzY4FsnPG8AmVoFNh+ER
         qt1vhPV7GaTu/WwBkxapQjnbzbxlLquPocpJSwzNH+fsOqIJYkXYHN9mtiyRAPNhi92n
         r9ev3U4OQ8QyEkl7ZQEqkln1S40YWxfmzTcjJw4R7Fv6r5gs7xAn1ymaIbEO5XptaS20
         yIGqIbr6TwQvIOMiduZyc3nVOIMlHa0JCRspm9Gf4lay571r6nBDp6aqvwSy8i6dOhhn
         y7XsJFil71e+HjRb8u0QIJH65eCFPERe2/pGJfdZXgWm1PkLIpQUMYuIS2In0reTBfr7
         OgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763508515; x=1764113315;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olNNTUm+BTLFO+ZiwDAf9pAOve+v0FNRwAZ4CxSj/MA=;
        b=tKfdkumtKXnMc5i16ZEGuOZKPMVXehHsMWvWeBMQLAiV1fnxXp8BRTpopxDSGTgk2m
         qzd61kb2snsdk39CjBQJFbFcmIslzGb8sv89e8rsQxK9Cnqu9OdP3yHAbOLYOZWW90iJ
         2xdVy8B6IFLTW8a+64cThOHJVVb0RRxARAFXwqG/Ky83csm75oBqbnWqA9/XuxX5W2DS
         Qhu8BwjC0pq4w5CMD48NDp+iM8kzyDOhI3u8zkEbWOPQ870ThHLOucN+PxQk1RSSuT7h
         gTpLBAL1p0qrdy8CxGSLapv4S90vLvRFTLZsOmY+HPUmrK0J9XZuA0Bw2d8rmKL8cNiE
         53zA==
X-Forwarded-Encrypted: i=1; AJvYcCUcAd0d8c62M4iE7VGUmj6WW1AGrZaNhnLGHz+k84ou9e4FCfegFl3sFhOwmARQ3/hRzbmrpr3u3FzX@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5eDMTIu5xlBIem+WQ5HkDTzHzDG8HbtiXwfLzFHAP7gadJasv
	gV8QgC3M9AHYXqlHdP4dY3/iB5WUqolOLCaqQAxJXXeU27omnrI4z1LPOUmtEAoO2Or/kp1XPXQ
	e8RihHg==
X-Google-Smtp-Source: AGHT+IGUP80RGTxVgmXIYbcLfL0s45FJBuzEh/YWaWtgI7M8kNRpd89qY03WQLaYk4SlG45sxcRSai97W0o=
X-Received: from plbkk6.prod.google.com ([2002:a17:903:706:b0:261:3bf9:662a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d501:b0:295:1e50:e7cb
 with SMTP id d9443c01a7336-2986a6e9524mr207276585ad.23.1763508515484; Tue, 18
 Nov 2025 15:28:35 -0800 (PST)
Date: Tue, 18 Nov 2025 15:27:54 -0800
In-Reply-To: <20251017213914.167301-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251017213914.167301-1-thorsten.blum@linux.dev>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <176350821965.2285420.6497416938072757840.b4-ty@google.com>
Subject: Re: [PATCH] KVM: TDX: Use struct_size and simplify tdx_get_capabilities
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Fri, 17 Oct 2025 23:39:14 +0200, Thorsten Blum wrote:
> Retrieve the number of user entries with get_user() first and return
> -E2BIG early if 'user_caps' is too small to fit 'caps'.
> 
> Allocate memory for 'caps' only after checking the user buffer's number
> of entries, thus removing two gotos and the need for premature freeing.
> 
> Use struct_size() instead of manually calculating the number of bytes to
> allocate for 'caps', including the nested flexible array.
> 
> [...]

Applied to kvm-x86 tdx, with Rick's tags and suggested fixups from the RESEND[*]
(I had already applied the original patches, and now that these have been in
linux-next for a while, I don't want to modify the hashes just to change the
patch Link).

[*] https://lore.kernel.org/all/20251112171630.3375-1-thorsten.blum@linux.dev

[1/2] KVM: TDX: Check size of user's kvm_tdx_capabilities array before allocating
      https://github.com/kvm-x86/linux/commit/11b79f8318ae
[2/2] KVM: TDX: Use struct_size to simplify tdx_get_capabilities()
      https://github.com/kvm-x86/linux/commit/398180f93cf3

--
https://github.com/kvm-x86/linux/tree/next
