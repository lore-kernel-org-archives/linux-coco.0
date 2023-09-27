Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8103F9D7
	for <linux-coco@lists.linux.dev>; Wed, 27 Sep 2023 08:25:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2bffdf50212so171908781fa.1
        for <linux-coco@lists.linux.dev>; Wed, 27 Sep 2023 01:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695803122; x=1696407922; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mBwF4TjOFyMQxtQEAd+K0NWN+3oWRxy6Qb0vWZMLSfQ=;
        b=WkKVDQhmhRAphur7m3VIq5N/JTVkyQT8c/bGtoPEbX62qT2P9/hVC/KefrfAY4Jtae
         OrN848UihseZlNjNdJdDBt6zPMwgcDn5Rsmmfk9YSQxmWuLfQdCErOmvfHjRv3dZbS8Q
         zg3i/Dq8xt9KyyircO1Ic6Rn1EQ4B0AwKO6nM0cggI8R3Plt+IvXTGh2VKg/5Qm8L9uo
         p6CnQgYCHK4mG9+BVbqQ1dd6oxsw7CsJS7yjPfv2pttCVz0S8F0PeRHuq0r26FmSR93A
         ZYIscHpWMg5gMeg1eLc71V7hrRIdp9a80w/7dslHJQXl0ccdnpRT+J9KCh7z/icaQeyx
         1JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695803122; x=1696407922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBwF4TjOFyMQxtQEAd+K0NWN+3oWRxy6Qb0vWZMLSfQ=;
        b=oKds8j3TkBChnzpMbwHPm9KtkP2wOAa2+psMAA9+Cp1MlNNwRZg8dQ6H/Wka15X3cq
         w/fqkIim4HOKgf15FcI9GB/yVPm0jKiRcZ93CU4SlvOGi7E5xfNz7vH5UdSIT+nu6CU5
         zC76kTENIhjkM8QXCvAt/6ET88HtVJxqLpkvRivVP9djUsSlAcyB3vMehXPr0eSflcsy
         9JmUCDhdrZt4rivOWhPs2xWGEQZKc3oaKIlIEbXA+FMjcxLuA45sPtdjizAfmqFe9WKl
         v0VdyECWDTvXgoxtLV/iZRTGEuKfaWMACMRu2EgD121e8dQ8SsAfLUC48UiKNK3WbqHr
         XTHg==
X-Gm-Message-State: AOJu0YzepaogXQHM0lceAcJj/feCwPJakovhXQ5lAvvd9JjZnwhsuXRo
	ZFBc1HiNjQTDBx+lhhXD7IZsp0s9HP4Ce6VdSKw+4g==
X-Google-Smtp-Source: AGHT+IFLYKNnSn8AMqtBsr7P4yryUjv2RNpVyFePMS9VlgGOQLYBn1L0H3VlWicRyWTB9+TEUYCH/1xAuPdUbGyKsT8=
X-Received: by 2002:a05:651c:228:b0:2bf:eccb:548 with SMTP id
 z8-20020a05651c022800b002bfeccb0548mr1347411ljn.0.1695803121875; Wed, 27 Sep
 2023 01:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com>
 <169570182987.596431.14062417344858914481.stgit@dwillia2-xfh.jf.intel.com>
 <c3d347a7-58d6-4830-aad4-d354b83f0704@linux.intel.com> <CA+1=6yfmLXJbZu7Gd7cp_HOAbmHwx54aPgozWKBikWwZSYTOZw@mail.gmail.com>
 <6513e6079a427_91c1e294e@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <6513e6079a427_91c1e294e@dwillia2-xfh.jf.intel.com.notmuch>
From: Thomas Fossati <thomas.fossati@linaro.org>
Date: Wed, 27 Sep 2023 10:25:05 +0200
Message-ID: <CA+1=6yeP6dDiXVQrxMt0AaEF_7S05p4Do67=ysXK-Chfvu-9ow@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] configfs-tsm: Introduce a shared ABI for
 attestation reports
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, peterz@infradead.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Sept 2023 at 10:21, Dan Williams <dan.j.williams@intel.com> wrote:
> It can be expanded when/if those platforms expand the
> size of the supported user data, or another configfs-tsm backend arrives
> that needs that capability.

Makes sense, thanks.
