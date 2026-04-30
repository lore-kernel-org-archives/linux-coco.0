Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7897C47A0B5
	for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 18:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573801; cv=pass; b=EWu2KA39VEqXUZExHTnwo2iFCSEm5ENZU7629+0r+5W4tKFrz7QDeRH9bigswkjmLhez/QNLaiwtPalPjrEMYUf2LEspZnB5IIcK7/kJ7zUxD1mzC0QNgvqV7eaigUUqnhiad0OzVkLDHY8t2kj3woN6Uid6ZAs/WVWT98ty6qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573801; c=relaxed/simple;
	bh=6074mthRigfzCqj8EUBUDZuPgxpsUrNJXIQzDxBC4eU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlgiSX7a+cmNVfJ9j/bV7yYn5X6AI9RThxIcoz7E6Lbe81O7NNr2e2E3jmYsa/l6ErJ4ZclT+X/oJ2+qC2UTphgdmPcghfPNFxmb0pvRVIPDm2mO+XZrS0JxIKGuSyOiCX1n9KmQuV3bA71WnwzIWIb+ziGuIMfrIwzEokeLozI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jkqikzrN; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jkqikzrN"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-95672e8d787so221295241.3
        for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 11:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777573799; cv=none;
        d=google.com; s=arc-20240605;
        b=HYQEklR495J9Gh99dKCb7Sri0t+u4fXxuEGOH2DuAZtS3UrYgRafSCtP6hSH5fRczY
         Twz9lzGKWCelSZcQNBEXfe2wqPzjNEJZCZMCi9ris3y8k3fJHQqXLtUZGNBxpd9Gfwiw
         zUYR9vcJYYiUtMdpETRYZ3sZIrtYIAG9mPj/80f+Y0jsoa6oNiBloyfjLk0vdcgpdWmR
         MBAk3F+01kxX3DJr2UgGMSe9RybGK7UBAbsAJ07+aN402MTsKDFhLLcHpP93p+7pk7gE
         nlwcVHvpc+CKLraTlSPL59xbRMdybswSJjRqVS4EuSzxqmOqan2OqKEM7FZaqAmPw9s4
         0yLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=6074mthRigfzCqj8EUBUDZuPgxpsUrNJXIQzDxBC4eU=;
        fh=S6AOrLGuACCEGTxmSDQx6CJkYi3gCKqQh5cZfEXdtpM=;
        b=gPfcNoOi9F3WtRHlo84xytNn5pPmR1w0D05lVhNMejdnAjMbz4PJthW1tXv9NBj2nz
         jSHlj51vy8u3mygbT1Iy3jM0IfYx2ub2YxI6hEzXnGjIolqgSq8yxXZjGY8pZv6TioGa
         b3G2wLaL125IWm70iS+825Oozd8gel8Ju+vh2RxgE0qvl5rUXy8eY8sPgh67TVSkQZwT
         uLrnu0wPz2/kFPxl3c9753Wcn8+sNfLysvT2QehrAOVtYY4o5CIA5BYaMx2gQ7/tlhiD
         cDKhxPNRylf5MTMwzKR77hpuGUIfIz/DSzj9aRV9nqXRmphgZAEElmBr4jiN5LyP4oiC
         DHEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777573799; x=1778178599; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6074mthRigfzCqj8EUBUDZuPgxpsUrNJXIQzDxBC4eU=;
        b=jkqikzrNsQu3vyWwpxjLd8PpSZ2TSPUw2yko+XTGwH1RvWas7PDEechScNxAMW3jXI
         8mUC5Xh05vuQALnv6xpDg/1ViIs/BqpX9F8hcVQkNHb9+EBu5JeRS6nDzw5GLoViUROa
         4w7mXooNFmuRCQSaFdoIq89pWJDGWCI1ji+jifVPAt+/tVs88hengHkrDu+3+eWRTHp3
         t7euZ1fWF2c3eIv80SLgtrvugjTEmusdaOP5f9DXFLwDQv+R4a4T1q63/FpAQjg/Fdi3
         J6ePasqaP+u6uS029KIF1SlEIy9F5baF2Zt5wOynjvCgCjeY9Ed+lcq86KvEh70W7Ce9
         CRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777573799; x=1778178599;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6074mthRigfzCqj8EUBUDZuPgxpsUrNJXIQzDxBC4eU=;
        b=e/lelZKpbjyyVFTjXfz1xeTGbWQWrANmRf9AO03NVBVztEvQN03426NCEMVepQgnBS
         8htInIJP7+5FJQ0UsZLP1TaU8RA/MMj9L+rvWZh+dJNZIo5XvrTGtqJMzrJsL8/5toFg
         Se+CRfHWoMLt09yItyfBOn3WIB6EAXF5jtYPunINmh4Lze2elF3w2+qfQCwT6EqTaWD7
         QOgq41EuDMJNlwE1NkVoGbc6RgcaDpIILHbHF5xAxhbbncvvqYgdcSJMdNjVnV03GpGU
         IcOYb+XhcOFvEfJ6kjWAMtcQb/Aun8whHPWepCBa7vMyuWK1L3usglD8H7jet01Ug7VK
         Nq9w==
X-Forwarded-Encrypted: i=1; AFNElJ+YTdr7r2qzz4Ct4ndG85pSfdAJXLELNoCVwXxsGevx1zATdTc9kSRkfg6fNPgLDGsWfa5je4O/K9KE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx42XaSq5GnHU9wSKbstZw5n/8L+0nPAzyyOfcu2mdI3+yZpPsc
	qmhbJDeAakOxbHVnE67uq0hsKpeNybW2zt8yoWyJvk61eQvL6GqHDBRzGbx4dc7Pgfh0dWEmH7+
	3bCvPi3DFiH5EkB+zx2n1c5304mXPKznKH1IWea89
X-Gm-Gg: AeBDievrc3Tv4KgD3rNJmwITaQaZ1B1ZdtfhuEFtUx1jE7W4p4bBAeoqqcaShhmUleu
	tjFtz68MZMCMgkXj4JqKZzVtBQ90901LBalanNqMGnthHPV5pvsNCpCKcCw0cK0P0Helc0deHHU
	1lN/fEXSnNSDK0sE+Tf34zOJjMymSEXvVDMi7YDVIvAF6YaiRT5r6EKTBJ8HojttVQSob0R8YUJ
	8OKJYrn4IsBH0MYvWA6ftNSPL9f1AsNmBnKOS+L7hsg6ExYi9qBBWNAFQKQ1rEBaB4aoLyJ5hat
	qMWqXdJxzVqn5LqNDes6pyhq5OwZjW3Trr4jJFa2+X10a0icnyssD1UugASNjwJKAkQ5/W5GXSf
	8M9sm1x0Qxxgt8sU=
X-Received: by 2002:a05:6102:c48:b0:606:545:aaec with SMTP id
 ada2fe7eead31-62ad4faaa0emr2260227137.27.1777573798837; Thu, 30 Apr 2026
 11:29:58 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 11:29:58 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 11:29:58 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260430015001.24242-1-yan.y.zhao@intel.com>
References: <20260430014852.24183-1-yan.y.zhao@intel.com> <20260430015001.24242-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Apr 2026 11:29:58 -0700
X-Gm-Features: AVHnY4IeaCzTmZjx-CnnzxAtYMnqjJZEzghoo63nZAtk-UoM-nu70gF3ZuOCUaM
Message-ID: <CAEvNRgFP9KJpWkZX-Of2mK9J57yiJ5bwMaQw-DsON-RkhvaMqg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] x86/tdx: Drop exported function tdx_quirk_reset_page()
To: Yan Zhao <yan.y.zhao@intel.com>, dave.hansen@linux.intel.com, pbonzini@redhat.com, 
	seanjc@google.com
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, kas@kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, kai.huang@intel.com, rick.p.edgecombe@intel.com, 
	yilun.xu@linux.intel.com, vannapurve@google.com, sagis@google.com, 
	binbin.wu@linux.intel.com, xiaoyao.li@intel.com, isaku.yamahata@intel.com
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

> KVM invokes tdx_quirk_reset_page() to reset TDX control pages (including
> S-EPT pages, TDR page, etc.), as all those pages are allocated by KVM TDX
> and thus always have struct page.
>
> However, it's also reasonable for KVM to reset those TDX control pages via
> tdx_quirk_reset_paddr() directly, eliminating the need to export two
> parallel APIs. Keeping tdx_quirk_reset_page() as a one-line helper in the
> header file is also unnecessary.
>
> No functional change intended.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Suggested-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>

Thanks for the cleanup!

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
> [...snip...]
>
