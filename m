Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635CE279355
	for <linux-coco@lists.linux.dev>; Sun, 26 Apr 2026 16:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777222737; cv=none; b=sQkkTXM3+0jM0EFw1KewVQ+XHR0Z1JVis6dIwohp3O/BeGgfC8R6wjb502iiTxr3btwReFRzvFu5eszyWkr6OnbWqSJ7HcuXRH9uzQyEyuz1d0/U7uU59YQLWeiB1UqwAW/kdMMtVHeWcSGlghPAgn5BT+3I0NB9M7ZMIG4S2Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777222737; c=relaxed/simple;
	bh=tm5fy1ToKvC5f3S/E/N4FlxHwS6bJwrzcUbcG0pYm/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGST5ZiiN1ayAqeVGkYujne7SweyrYhhmUvCVFr5QS6WPGFiQXHG1n+U9hbM8Da3TxeixhBXcb9pYiuaBJpnN63itMPRamgsd9OeKOyzBdnsDLkbjEt/Bf72fVTDIQApJ/+wckF2fS7fXgGjpz8Kd6vNoPQhPhwZPvvnv0pXHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WDoG0+iF; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WDoG0+iF"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67893fba9c3so6356165a12.2
        for <linux-coco@lists.linux.dev>; Sun, 26 Apr 2026 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777222735; x=1777827535; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LTjMHFt5SpHHHtmrX90tkNkzhKqrNiTI1ZSrIW/c/fQ=;
        b=WDoG0+iFGKgVk8Y8tJU+vM+XOrQJPAuIIqmTZYrHe8KuZmMn0ms5owgq/feQxp4W7v
         kMlxCkt3CrEbesWDS1XzWf1lTvtvFiWfizQ81wHSWxs4v3LLyE6Qg1s464h6BSDrmZT1
         Igh+5ofAVAjoWQyzsskY/htL2q4kmCDVMIV3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777222735; x=1777827535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTjMHFt5SpHHHtmrX90tkNkzhKqrNiTI1ZSrIW/c/fQ=;
        b=WwaEVQz48F5TCGGNDknGHnNdopv5Nj16RLUOQxB5q8YHUt9WY6f7F/LK4MH8nNgjBO
         j5bJ3PpPIEdtbS88RJEc9qPiKAf8aPKqgrEKr44ZacrECzRACSVHlCozgOJ+M9q7aUv1
         4+NMunyb61IGr7I5vnUstZVH3aMF5IFUq6g0qYk0KeLFtCDPNQVpf3ZI28dSfteE/EaR
         ZYFJxhEHTUZtEQTu5G39KA/CaE4Mm01/J9QQkFyjPKLZyc2pZXdccAQoHlCcCx4JZ3bo
         7NMOnbGEssXUSlJ7EQi1QY1caz1zSi+4AkatvCieofvwBK/pX7lkSk5Qx6D2aaEiR7YM
         /bKQ==
X-Gm-Message-State: AOJu0Yx2at3S0QHAG0UqW8436W7D3+DCe4xXLLmjzvZR5BAzwSHQnnH4
	LtMBJbynW3RV4G3ZxlB263pkWo7jXZgnzVjPANDF0omHaXwgLaj2j10ygM60IiqTB5kBIB/YgJo
	9IOV65jE=
X-Gm-Gg: AeBDieufb3L7tslnLO+u/xRIARh3e5/h4a0DHKMJwMtFV4VQbBPH+qC/HprBlEEM/Hv
	+WoKTrtLr6iTScZW44ljvsUVc/4Fk3a+9YSdjU5V2s8BoHYMINEIQUE1jxOpeI/IhUJaeCbQfRz
	yvLDpFu5yzCjTeUte5x1SiB5w0Smcq+/5Kaiq+Ii8zw9nbwbYG+O0a4Ych/oKGEipUgnOath0oC
	7diqtshsMrGpiM6UqojJOx94V41rME6zHLl5yigPH1AdWqddBV8ZjjemBLlmB5DoxLqrzGiFj3V
	BJJhIpCPSBUiU+0QIJ2WTL+D/Tx4/0ngArCk89EWe6qZektmQSSA70UbLaD3ZL6/ThslQBfBeJa
	L8XD85kpzNO9jomn8SrAkwnfIWJpNIo3ltTgFhRzMA875vg5QjEFQHywQJHEX0GtB6G8muP1lWc
	dRCeBWaAqd0XSeuXy68oSywOiUZvEDOL9hmLx2MgPHaw/yY/O6VAwARYL5tPvFpakcpjrEOE93W
	fU0wyRoum94/l++siwwrg==
X-Received: by 2002:a05:6402:3225:b0:678:91c7:6723 with SMTP id 4fb4d7f45d1cf-67891c76ad7mr6103318a12.27.1777222734612;
        Sun, 26 Apr 2026 09:58:54 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e18esm6259933a12.10.2026.04.26.09.58.53
        for <linux-coco@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 09:58:53 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so12021276a12.3
        for <linux-coco@lists.linux.dev>; Sun, 26 Apr 2026 09:58:53 -0700 (PDT)
X-Received: by 2002:a05:6402:c46:b0:670:d548:da79 with SMTP id
 4fb4d7f45d1cf-672bfd87175mr17291351a12.3.1777222733582; Sun, 26 Apr 2026
 09:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <69ee3920ef32e_fe08310024@djbw-dev.notmuch>
In-Reply-To: <69ee3920ef32e_fe08310024@djbw-dev.notmuch>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 26 Apr 2026 09:58:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=whJSiwNBNts_XSrYosCR1SShEF8xS8sqh-qWK4zLBz4zA@mail.gmail.com>
X-Gm-Features: AVHnY4J2kLwabfDUNCNiY9ERSaecxwCFnVdEqHOZLr1yO7hdrOdftwBUpI9250Q
Message-ID: <CAHk-=whJSiwNBNts_XSrYosCR1SShEF8xS8sqh-qWK4zLBz4zA@mail.gmail.com>
Subject: Re: [GIT PULL] Trusted Security Manager (PCIe TSM) Update for 7.1
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Apr 2026 at 09:11, Dan Williams <djbw@kernel.org> wrote:
>
> The other motivation for sending this one-patch pull request is to test
> that you have my key with updated email.

I didn't, but honestly, I don't match key issuer ID's or the email
address the pull is sent from anyway.

So I just want the signature to be valid, and from a key I know.

And it all verified with the old key, just with a

  issuer "djbw@kernel.org" does not match any User ID

warning.

I wouldn't have cared - or noticed - had you not mentioned it.

But I did update the key so the issuer warning is gone too.

         Linus
