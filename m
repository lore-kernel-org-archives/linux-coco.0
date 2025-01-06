Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116811DF998
	for <linux-coco@lists.linux.dev>; Mon,  6 Jan 2025 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190902; cv=none; b=HNBl8j+zTuEvP5Zjwr1wTdXB38KsLCrFl71H4MPkP8nIKalUof6G7+XGCglEnPkZW6+6GUbjgIzM3vmrUwyuFiCd1j3nwBYoeA+k10qRX49chXN03G+EtgZCTQYqPt8co5l22VdDp0S3FrMdshcYZnI3SlrQhBuMwrXVy/F60Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190902; c=relaxed/simple;
	bh=pWFPI8QJJNsIr4V6BgsoBxzzDcG87tMmwTYxt6RmSrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDU4TFm1IT6tinaEpkvtCF43yrXSHEa/2om7TO5JQJhKfegCtpxSjqhY1CN48v6b/8vLT4iFSDQOAbydCnElg9V9Tz0tTJmQPmwsgIEkTsfqW9tBxshxyWzv0keSsrD7n5gDHXWyoK0nSaKS/9gngbiMyzTJSHhZWxA5lOMx0h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jwfRqpdY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jwfRqpdY"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa67ac42819so2121572566b.0
        for <linux-coco@lists.linux.dev>; Mon, 06 Jan 2025 11:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736190897; x=1736795697; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWFPI8QJJNsIr4V6BgsoBxzzDcG87tMmwTYxt6RmSrU=;
        b=jwfRqpdY8bwkyhGI2WbkYA49KawKxz6itTSq1NGek8XE6N8eeJL8joH6DevK1hvZWe
         y7wjAS04r7uFJHXEAo9l0Pl9SIjLMARqnasdP1Y+kH6uLO5Cn47k7ph5mHr+8IHY6UCt
         d1Jf4ZYs9XKwk//RFN/apL8LI5h+bWnJDa5N4O+aUyrznIUvBvqMT6bzwC7R6QKq7w92
         Co1jkKvjTCfXsQ+0oQPQa9Z69oX93sohwdupqIvqSIwwqpIJQmNOrXCyLEE3z4mFEmzx
         ihtPgKHEDkXjehPN1XzKrq5g3gnmsWL2QynosEuwMO+jhPC0w91LhG2tnSztyVnASV5r
         mrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736190897; x=1736795697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWFPI8QJJNsIr4V6BgsoBxzzDcG87tMmwTYxt6RmSrU=;
        b=GuZ04xfpzZVWynbnf1HHYuYVfjsAN9Ntv2XES+u7xv3utlC5OmKOFNUG0u9ROzsKEv
         GlINB1Cre6Exv9b3JOZCFlJRoNMwMhXjg06ssbK1NWHZrW+6aNBkwg+hmP8lccpHWWlc
         D6XU7bUA/Olbl986NLjEKKOoRfTX/uYsfupwa6WoY5cu0+zkRqUzMJcRPGmildVoWpfU
         aYqOcxb8j60lBUAwlXrLd7fJvSKH71Gw9c8XHsNPolrlIVD0AuVrdcTaBu3bDrIW2+Xo
         wkn/bHj9z23ZclTZLMxBVrqCjE/twQwOjoYsjit5+616io+FJi6vUWbtCmlIEsrkYe3K
         K2eg==
X-Forwarded-Encrypted: i=1; AJvYcCV7peelApbtD+FkDH297J3mmhRf1DVSY71D74jZW9FyPNI6vFMU5OCAMlFChR9q+UEpcVf7nQCUjxaa@lists.linux.dev
X-Gm-Message-State: AOJu0YxySnKB3GGsHI/86G+edLi1AwXX2FazQbUqDS8xiB7I3Ra/1SU1
	xhzKmaT15HIZSCK8Nb1YgLHG6pG9IQpzVY09hU7x/omtD0+H7AtFw7E0HkXmS2dn+OXnHEHwbYW
	Hq2iIzAs6Oa9Y+ZDPZs4p4EvItnDou8+uUrUz
X-Gm-Gg: ASbGncutf6Vzd3KrfOQCmqSOSpzawUrx890VUXHZ27KVfzHbzk7gPBUp9BI0vTveFxz
	O68ANmcObVzUeS9xZrnqwXDNM1/GkM7Qu4DAMpqU=
X-Google-Smtp-Source: AGHT+IFQF+5hodEi32H1hrqQbRqo4lGqqJT4JUu9venDeqnG5Z/fmBuRxtxtizB6jozSHAAECXR5Acsg+MTVa4cBYlM=
X-Received: by 2002:a17:907:8dce:b0:aae:df74:acd1 with SMTP id
 a640c23a62f3a-aaedf74c300mr4344217066b.11.1736190897042; Mon, 06 Jan 2025
 11:14:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1735931639.git.ashish.kalra@amd.com> <da32918b84ad6d248a0e24def7955c0912c9cce3.1735931639.git.ashish.kalra@amd.com>
In-Reply-To: <da32918b84ad6d248a0e24def7955c0912c9cce3.1735931639.git.ashish.kalra@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 6 Jan 2025 11:14:45 -0800
X-Gm-Features: AbW1kvYLvnLWYWHAYDSxy7Fc949x5JRieReC9MaIJohfifoZer-rKc9QHEboxOU
Message-ID: <CAAH4kHYsK8Uc2WePxfpPm=hwCybrABTjJ5Cw8rRGJ8UyAyE3Vw@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] crypto: ccp: Add new SEV/SNP platform shutdown API
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, michael.roth@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 12:01=E2=80=AFPM Ashish Kalra <Ashish.Kalra@amd.com>=
 wrote:
>
> From: Ashish Kalra <ashish.kalra@amd.com>
>
> Add new API interface to do SEV/SNP platform shutdown when KVM module
> is unloaded.
>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Reviewed-by: Dionna Glaze <dionnaglaze@google.com>

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
