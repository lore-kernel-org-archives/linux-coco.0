Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C51E125AD
	for <linux-coco@lists.linux.dev>; Wed, 19 Jul 2023 14:20:09 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-ca8e5f39e09so1422592276.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Jul 2023 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689776408; x=1692368408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nhEe8Ro3m3xzVle4clHGMPuyDiBtjYljaeIOHNrxaD4=;
        b=W5CztIfb2WV1OWqLAThymisnkJPQVhPq+rptaayQR88+SC3tZCZIZmDvoAzm9Rc0mr
         zT4hx1GUSD1sD7nHriR2nT+8WYZ7RQfzs61CwB0q/PMbEhe3SFBgktQsio2IgawVLhkr
         BYDmSWHJnulfQ8y8LqLZCLucqszhaZj4dHelTBP4r/9HO2L1uU5wOUOiH5/IVgelIGbW
         N228nAnoKOTr9l2EvlOOpnDIJHzBpPdiKrtJ3o6nFYbhcUXMBIE81Eb98RTXzJ+AIlgW
         5TLxT88Puoptxkgyii/kXfJ8SjYs2YpNsxVtYoegULEMlwsk198zpQZnISGnP+Gbm39y
         dCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776408; x=1692368408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nhEe8Ro3m3xzVle4clHGMPuyDiBtjYljaeIOHNrxaD4=;
        b=czf3EA9rh+rM/TwdWhH4YBk758CwaEMDbeLW4ywj+bsOGbhJpDa9hGcYKSCrJE0K6V
         xSiRxE1J26/Nytv68dQTUDjd55su9tKZag1drR2WjwROuk+AxsYV1/YWZzVUZEMxpK0x
         1/HW0hnXHSCpDr7zg4VFQ7P/dauimHq7SfLQI+LygORv0QQrCQffv20F6y5C1yyjli38
         YOmg5raP3uAJ3kqJ/41zHNwvB/Aa2EAPK1hGcEgaS1mb/ttCww3m2I8H4AQvFsGWWT8P
         VPOTWc9mZBCamxFNiArIsHTJ+ln7Nfl62H4QuXgMY/WFkMs52tF1O1wFDXQTrUI/pF/H
         zhIA==
X-Gm-Message-State: ABy/qLYimBs7bzphJ8nw1o5d+/f7kuNkerL3eYJ2qxtWw/QTCD/3tNbC
	/+J+onRHztlmStx7EUe/XljetqbTLrE=
X-Google-Smtp-Source: APBJJlF2IkKp6n6PH2OlPb2WtD4mLbCloSic8/PuahGhbvnmxuxv/ezql90pF+Be+RGqIUM1q5hZ9k9FdQc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:f509:0:b0:ca3:3341:6315 with SMTP id
 a9-20020a25f509000000b00ca333416315mr33581ybe.0.1689776408256; Wed, 19 Jul
 2023 07:20:08 -0700 (PDT)
Date: Wed, 19 Jul 2023 07:20:06 -0700
In-Reply-To: <cover.1687991811.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1687991811.git.isaku.yamahata@intel.com>
Message-ID: <ZLfxFkFTotkOumRG@google.com>
Subject: Re: [RFC PATCH v3 00/11] KVM: guest memory: Misc enhacnement
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, 
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Michael Roth <michael.roth@amd.com>, 
	Yuan Yao <yuan.yao@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 28, 2023, isaku.yamahata@intel.com wrote:
> Isaku Yamahata (8):
>   KVM: selftests: Fix test_add_overlapping_private_memory_regions()
>   KVM: selftests: Fix guest_memfd()
>   KVM: selftests: x86: typo in private_mem_conversions_test.c

Folded these fixes into the guest_memfd RFC[*].

>   KVM: Fix set_mem_attr ioctl when error case

And this one too.

>   KVM: Add new members to struct kvm_gfn_range to operate on

And also included patches that achieve this (and will also post them separately
as non-RFC, mainly to coordinate with MGLRU).

[*] https://lore.kernel.org/all/20230718234512.1690985-1-seanjc@google.com
