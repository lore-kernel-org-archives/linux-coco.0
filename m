Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECBD14AAB
	for <linux-coco@lists.linux.dev>; Wed, 27 Sep 2023 08:43:58 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bffdf50212so172296431fa.1
        for <linux-coco@lists.linux.dev>; Wed, 27 Sep 2023 01:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804237; x=1696409037; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KCkza55Bwm3HBRjy5gx9XLQCeSfCsP7GfuZ+jZDqYqw=;
        b=i0gVhcY+XElM7bA2DCA6MDmA5Xymo4hmqtIYTyLRoflqqfjj2pK/FwvLsn7+u84xWy
         DViD6bFFGY8ylrYZ33xH/8vyc4WIkIr9vOHccz8kvf3dkuPc6LL0a5p58y0Twh05u8i8
         evGio/S06rUTS8krg7U3daym6KeeGHa1RAP83NgKvCxCWZEgYunEmaPXP6KwXgVLkdZN
         YAmxu14SDIU6K61kx0XxhtXdiDTEE2yXEvmFF9qBNVKL6MZCxnLOReLgC45ua0L/R9zq
         zgq12XfVQvPWpWbxZ18S4Q3nW9b1XXbocyjZtXWN3GG1LtOmShx2MmGPz+qc+T1uKY3M
         6zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804237; x=1696409037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCkza55Bwm3HBRjy5gx9XLQCeSfCsP7GfuZ+jZDqYqw=;
        b=N67HdADl/ZDflZRZZqOn8FYgzw55JjCf4GnR2Rr45VnWKNgUDPsuOStvC+QqKWHIDU
         o3doBOn9m6Ez9iW9tHXR5foGy+CxnPbVw8Z3JnmA/eHnpWP7GEkcHEGDdHZmYwgxc6n7
         RD4WyV2lb4jFNRgYZhxe4e/oGb2OKxOyFYUZhcRmqILIly+8LQdTjdCsY/5H1RObNXuw
         7wRQxp6W7XbCyPB3dbd41kDD7FudT5SS41ertPFqmm1lCnDxQwl8VdZlnR2Rqn3jDHLZ
         EdnMEK5jtH6Y7fKj0fPP1No37QbDolYBTnEshJ6OXH9NoQtpk0cf+fBsS41B068IHSRT
         G6tQ==
X-Gm-Message-State: AOJu0Yy4HJoo/4xq7ZlJ+kX2hXtbkmyiK0TW306T/3JgkindcaVTAaGO
	Ngqup3FrW/+qGD/c7U7FUiV87/RZ9NztQorVAoqpfw==
X-Google-Smtp-Source: AGHT+IE7Akj1gkfZU49/hgqEVZAQMUM1wLScrcB5V4TjMtUkPkchUmssEKLJNnUKIAgOAz2uYNKfsTcxRUUXPmMhtdY=
X-Received: by 2002:a2e:808f:0:b0:2c0:d21:39de with SMTP id
 i15-20020a2e808f000000b002c00d2139demr1519425ljg.42.1695804237206; Wed, 27
 Sep 2023 01:43:57 -0700 (PDT)
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
Date: Wed, 27 Sep 2023 10:43:41 +0200
Message-ID: <CA+1=6yehiG+-Mnn2Xk6TdPqjkucANpwLvcfLdd9sDG2foeyRaA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] configfs-tsm: Introduce a shared ABI for
 attestation reports
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, peterz@infradead.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Caveat: newbie here (just subscribed the linux-coco list) trying to
bridge the abstract language of IETF RATS with an actual
implementation of the architecture.

> +struct tsm_report {
> +     struct tsm_desc desc;
> +     size_t outblob_len;
> +     u8 *outblob;
> +     size_t certs_len;
> +     u8 *certs;
> +};

Could you clarify the semantics of @certs?

Are these what the IETF calls platform "endorsements" [1], [2]?
Or could a DICE report (which is a cert chain) fall into this bucket too?

If the former, maybe @endorsement_certs (or similar) would minimise ambiguity.

[1] https://www.rfc-editor.org/rfc/rfc9334.html#name-endorsements
[2] https://www.ietf.org/archive/id/draft-dthaler-rats-endorsements-02.html
