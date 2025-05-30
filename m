Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BDE1AAC9
	for <linux-coco@lists.linux.dev>; Fri, 30 May 2025 04:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748579675; cv=none; b=MgB2FRln5+dUfb5iywWLdUmH3kdT0ZA6f9nGyF/OteVXgUIABvkpMOzaUaAOI1gkmP984aGWW06QbP3jW99vqhvYW9LY7EV+SGbo05zgalGanWPPbQgA0YgHYTAFxWgjT9Yx0mlQls3CFUxaH7M1QnB700sBlzgupGgWhx694SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748579675; c=relaxed/simple;
	bh=aqopuYNBjpgWPxSWqUApYvJwsx9E9sG/TE6NbX4LzOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMlIQ9zXWpGNOW9bfhHmyAtDaOFQ/bIpJODAMNcP3EHjx0jzWxUDvguwiYK9bHFZHL5dJVlK5WccW4ChdGls2qs+oSHCnVyvL45VcvCgn49j4hxnNmu0NDaB5BAeihLsomSmtTWKywXIx/F21lzIeHnQkx6s5vP69euqETM/m2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BnLTgpv5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BnLTgpv5"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb5ec407b1so270702166b.1
        for <linux-coco@lists.linux.dev>; Thu, 29 May 2025 21:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748579671; x=1749184471; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=71NdO+qSnTa2IaPLVhqylvr3d6ODHmzimSLWfoeJiGU=;
        b=BnLTgpv5x13Gja7DLuTTkaEFuPOWgAy3RgIgrx7It0AO//FFuPbaQCmlLyGroGqm3u
         jPf8rERho+Twtbz8IEp1YR2e74C6esFHRXaKUO+4sazkZZeecKTweNy6dzD1ruCFWfDM
         d073mTZd0VKPh897AAAHjD5yvKwiWMjvhLgzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748579671; x=1749184471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71NdO+qSnTa2IaPLVhqylvr3d6ODHmzimSLWfoeJiGU=;
        b=kCY3WR/4mhYcKXblugXes3VEMGggbWk6pB3QblSkHl4TlVvv+q/wrqsMqpuZlIafX3
         q65P090J4ImeUmISX4Y7XlcdpCuMwQCD6q9gO0RpKkdu+h34auPH0qWJ7zOYHBG+M3AD
         TjEBvgFj8sl/z2Qao8D8LVNIuZzy8ibR8KAb/T2uwSidwBcFvHYYBap/NBfzOfYPNmXP
         edZQMkpevtq+72VXH3wLKFA7meCexMIF1T55DbuV42ShdnOt1cwWkB7ukFvAs8LQPB/1
         mHwCwcuVgqW7Ynw4398eDLVFLBXIDpC6Ypl2ex01WR9tsXB+0ucrX3TMBu5DAjuHESbt
         lyEA==
X-Gm-Message-State: AOJu0YwLASmaG/hx7kg8U8sFLuAJ4Q4u4iPPb/v5ga0tf7c6Bok3mPy9
	Qjguoud9VUWPIPCCHDCKaiQoVw5BghDWJvUXlKcgO2nm+PnUHCuj+FIsBbHkxf+tJD3PHYuHKT2
	snc7hNA4=
X-Gm-Gg: ASbGnctRisM9d9nC8CMGdzNs6WpjojcNNSFNfoZ2XNDJQ9LJ8w5HVytYZPp0Imesr1B
	OS1u7GMQKHPZWMMgCeQSZ/GK6XJ3oAxJkudmp3BvZUmByKsY3Y0ABkW1Dl0UATAfvrqOPjxrC+L
	jE/5pEctsaMLxSb5X9+0xkH2pxxHYF0sg4BFKHSBa4PMeAbqSP527uq/DCkO55Bv7FJ9F0R2qha
	i+7GDWXkW7mgRCZoklfqLARqA6G1/Tr2YJZQNkb9VM1rJFKF2f5Xn+3O2MBdj8gBfbUd8LYthAK
	Y5oobaNRKNCmFbj2FZ6qigkjF5tqSalWmIq7JrQo/tnclIOFSvpBjWKbkMjWDHqdy5wGVkxDQ+n
	kL2OQY38AjI7Q/gd5zrLkbX1dVQ==
X-Google-Smtp-Source: AGHT+IEE5RDK3e2FiZan+H98LPWenpN5fa1ndIdYdY8hLz5bnlUECNGi+4ScYbJPUYj+HWkIUSR2gg==
X-Received: by 2002:a17:907:6d25:b0:ad4:cfbd:efd0 with SMTP id a640c23a62f3a-adb36bf1b1amr67004866b.36.1748579670728;
        Thu, 29 May 2025 21:34:30 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82dd12sm257627766b.58.2025.05.29.21.34.29
        for <linux-coco@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 21:34:30 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60462000956so2697897a12.0
        for <linux-coco@lists.linux.dev>; Thu, 29 May 2025 21:34:29 -0700 (PDT)
X-Received: by 2002:a05:6402:3514:b0:5ec:cbf8:ab28 with SMTP id
 4fb4d7f45d1cf-6057c6036d4mr668190a12.22.1748579669595; Thu, 29 May 2025
 21:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <683902e2e98df_218f10017@dwillia2-mobl4.notmuch>
In-Reply-To: <683902e2e98df_218f10017@dwillia2-mobl4.notmuch>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 21:34:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjvmBiZ=oMnR-R9rqzEPnGCaU7dNLkY1RHXwjRCAR5YQ@mail.gmail.com>
X-Gm-Features: AX0GCFvmQzSC6lQGZ6inWJ67zrkZledBxNhSJvbiAXwywaQLWfY_gWoWq65MOjM
Message-ID: <CAHk-=whjvmBiZ=oMnR-R9rqzEPnGCaU7dNLkY1RHXwjRCAR5YQ@mail.gmail.com>
Subject: Re: [GIT PULL] Trusted Security Manager (TSM) updates for 6.16
To: dan.j.williams@intel.com
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 May 2025 at 17:59, <dan.j.williams@intel.com> wrote:
>
> ...to receive shared infrastructure updates for confidential computing.

Do we have a sane name for this? The pull request calls it "TSM" and
writes it out as "trusted security manager", your intro calls it
"shared infrastructure updates for confidential computing", and the
MAINTAINER entry calls it "trusted security module" (note the
different word for the 'M').

Making things even worse, Intel also uses "TSM", but in Intel docs,
the "T" stands not for "Trusted", but for "TEE", which in turn is a
recursive TLA meaning "Trusted Execution Environment".

Yes, I've complained about odd TLA's before, but TSM really takes the
odd to a new level.

I've pulled this, and I've used "TSM" in the pull message, but I
really think this TLA disease needs to end.

Let's have a rule that TLA's are ok _only_ for things that

 (a) go back at least four decades

 (b) have a basically unambiguous meaning in the industry (let's
ignore IBM that made up their own naming)

 (c) when you google them, they give relevant results

So, for example, talking about a "TLB" entry is ok by all three rules,
and a TTY is similarly not a bad word.

"TSM" fulfills _none_ of these.

Please? I know you work for Intel and you probably signed some
paperwork saying that a certain percentage of words you use have to be
TLA's, but please ... We can do better.

              Linus
