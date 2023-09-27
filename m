Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561411FD9
	for <linux-coco@lists.linux.dev>; Wed, 27 Sep 2023 08:04:43 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c012232792so178989941fa.0
        for <linux-coco@lists.linux.dev>; Wed, 27 Sep 2023 01:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695801881; x=1696406681; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HK/8Dajte472KzlqsoW1YYI86LGqovc35i9+35GKRvo=;
        b=ikRJ/pSYNcp7D5pGZ1yl6csYscen5vRrr3nn/wT3Y1dqVKii6bZykwKnOht3bp+7Fz
         ErUSAu24dRG2E57cLiyo/FeyFwLzwWCck/mXQXA4X77O7qJbzZ8/ZebT/AlrcK66wTgR
         kCCJpoQVxSJT4AzC1y8S4XH0MvosNIKPr/zqqG/gdKEHMJhAHqbljN/DleZQox3vbO4G
         Q2Q1ydL/soX2GrVtMSHZEh2qhbv5caWESvXJ7zRc4H4EkPyzhhHVOt54lc4hmfi/iVD+
         uXIAILWYd+aCorOL8GWoBnmDh4LUM8vFdsysj/F/6IJxnZEX8xzreXqxvSKXAbnzp0aI
         5xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695801881; x=1696406681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HK/8Dajte472KzlqsoW1YYI86LGqovc35i9+35GKRvo=;
        b=IVj6teT/ev4V3dZg3zLWj5hIhuK07kwzUlEuOfbs8+5ixzb7VQg4etRxyk1Jui60Pm
         zLDcs1O2VczU0PeV4eGKkDF1Y1MxQBOu7SbnRTOOFmo989wWJdmTzkZxtOQDjh7km6kQ
         9oF2+UvaD9fiTqeBwBOGzv6P9wIV6+WoqgC2Y64tBKTmZnEouuLraBi4pJa9Luwxsevf
         p50fLvs36VTCdwZteH+20YhY6YIfHrEzXFcW0SvkSPPEsqW0ADB89xf+gfa2jCv4JLIh
         fYYs7J2qKXOPrCc0b9GVyGjA9sCDeh+2LIBoTsdedD4rkefZnkxMRP9AnV9Xnz/K0D2P
         T7XA==
X-Gm-Message-State: AOJu0YzFmobtWdXbfJBeH4zQpy/JvSc3jvA9tpjdXc7imrJcuudBZma3
	rFXh1r86C/PPFD5V//HbHVr11gCSrUa0nmZ2y97fFA==
X-Google-Smtp-Source: AGHT+IEZiqCCfFdYdxhBJFji3jZg8flP+hiyvqepe1yVonPxH26q/oTC8hEiCRjYYWJvK9nVjA8/SrSKyVrYJv72jJM=
X-Received: by 2002:a2e:a230:0:b0:2c0:2b44:6eb7 with SMTP id
 i16-20020a2ea230000000b002c02b446eb7mr1300087ljm.35.1695801881296; Wed, 27
 Sep 2023 01:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com>
 <169570182987.596431.14062417344858914481.stgit@dwillia2-xfh.jf.intel.com> <c3d347a7-58d6-4830-aad4-d354b83f0704@linux.intel.com>
In-Reply-To: <c3d347a7-58d6-4830-aad4-d354b83f0704@linux.intel.com>
From: Thomas Fossati <thomas.fossati@linaro.org>
Date: Wed, 27 Sep 2023 10:04:25 +0200
Message-ID: <CA+1=6yfmLXJbZu7Gd7cp_HOAbmHwx54aPgozWKBikWwZSYTOZw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] configfs-tsm: Introduce a shared ABI for
 attestation reports
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, peterz@infradead.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

> On 9/25/2023 9:17 PM, Dan Williams wrote:
> > +++ b/include/linux/tsm.h
> > @@ -0,0 +1,63 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __TSM_H
> > +#define __TSM_H
> > +
> > +#include <linux/sizes.h>
> > +#include <linux/types.h>
> > +#include <linux/device.h>
> > +
> > +#define TSM_INBLOB_MAX 64

I guess @inblob is supposed to (possibly) accommodate nonces from a
challenger, correct?
If so, 64 bytes may not be enough for attesters that produce
EAT-formatted reports -- see [1], and [2].

[1] https://www.ietf.org/archive/id/draft-ietf-rats-eat-21.html#section-4.1-5
[2] https://github.com/ietf-rats-wg/eat/pull/421/files

cheers, thanks
