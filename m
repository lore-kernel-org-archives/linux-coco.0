Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0903207
	for <linux-coco@lists.linux.dev>; Wed, 13 Aug 2025 00:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755044346; cv=none; b=C/pwikN70+efCgg/NN+f+P11LXq5NpXpiq+ugLwWSYvV3raJK4MwmuNylSv42ytvHG6Rr5bZ1I/O/aBnCUqiqBwI6k3uSKU1Dv4Gk5CbXJ9xvLPM6NZE6idBBoUzK5GV/Gi3CJ1wAWpGEQYsjpidjXFwgubbgr3uV//9J6ZNOvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755044346; c=relaxed/simple;
	bh=pJARVKcCUedtd7CK1Bh6kczqQ9W8RfiKpPJ4TG6cCgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8rM1lukeNzLGEWrA/Z5eKDDvSnSCiebpUo1kgLGNm+AY99rpW9tigCdIJFX02oQWYWgiM4YcdZbjc6CAut3CPp6jrqS0gwtssljaSifmzlFLloVgD+8zWwJDuKBuZ1d0Rl1wVJY4EJIFK28Jo7Ze9ozEwNUekwgxaQ8QO7HyQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v+P4XyxO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+P4XyxO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-242d1e947feso92585ad.0
        for <linux-coco@lists.linux.dev>; Tue, 12 Aug 2025 17:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755044344; x=1755649144; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJARVKcCUedtd7CK1Bh6kczqQ9W8RfiKpPJ4TG6cCgw=;
        b=v+P4XyxO32b7OqeZa3Yxmrq1vQp/vTJQmih5Sk6clRrbRCUkDM6g/D+JZm2JSSLRCr
         g/Fs7h+zU0+O6GgjSgVus20z8tS9DOkTgT7vK+RtMWGXM5Fzz2O3yuFbyDtchiTb+u5B
         N6OwnHsaaOU27v3eYVUasfjf9y8Jy0GxhK7gbw5Onifc4Kj3FwsMQdYXVZW6cUHiuJJo
         YdG/JbI/80KiuM0DOdgqmep3SVSfhZHZYw5Qfoxg3lQdI0i3EHXatt4GnMGh4ivMs/ya
         TkULL3e7QJJogf7FzitxmSsxL45JSlQUjillfid8xn1QjJLFGPqlqK0ThI1Vx/Xas3E2
         IXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755044344; x=1755649144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJARVKcCUedtd7CK1Bh6kczqQ9W8RfiKpPJ4TG6cCgw=;
        b=GDx/ygZP3b+oA6MUXuTbC/4n2w73DYKDZmvXWIvncEYxARfPVYTb3r1jLLzwn0FtJk
         kEHg5RGkr/q0HXSuOkxrTsMwT97Qc81VPi6p+FrBKzMiNuD/8YeND641Lbz6DFXV3l+A
         KKG0FIAKhXNHSu3cdmxQiMw8TEdKAuWsyF5XYJY69pL457YzPevrNwvY4aUjrvG6LcQn
         b9ji3mt/U3WH4HehKb4K4gfzNLboeTDChJAEa7XFghj82nQwBp0gos5jI3XKm9OTqFDV
         sR744p5vvsF+VCU0K3CARKpG8MgJqqzLQOLPCxmhwqb9cZKXmCqNkP3EfgYHWzfPuQzp
         adQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuW9DQzMtfrM1afGnJbCgEP3eQU0xiBf6QYFN5eFu6bJTp/wReLuxQXU3WZmIC0yR33M/zCsJGo0yv@lists.linux.dev
X-Gm-Message-State: AOJu0YzuH45u4LCAJ5ZzEYbSPSBJD4yEy+UWuf/l4JAlrSQwctWdspWs
	DYVGlxNuCzxYjGUwYy8EFAR6+iBFMXiHtjGmPcZrj7ZbfHwM21MCMM/o4wogmTZqpiSlAiWQk4y
	tTPjtKRMlIJ6KZkyCV1Mzb6ihhL7Kzh8duypRWY+U
X-Gm-Gg: ASbGncuKHAWT4lf00X5S0eqFOZMSEcMbEu1cN6V+kH+lzL0yLEwE04yP3bdwQGoSSEL
	R/iKCGC7r4ftZRUukfyXvacQEZrJt9piEFlpGsbpP0BYv2Vxa9O7pE1n437jTDMhq3tr7f1LWdn
	P0YU5fDpzjB8OSyg+/9G2pdv11BweKk0UrNqUEUmL8U9IY2wnAs4+L9xYiTK97qaQ1nRa7qJDtR
	Y2O/Er8ufET1mopZe36O4z09mAQYi/UTb7g
X-Google-Smtp-Source: AGHT+IHJqyzxyBLp/fNRzX0VvbZ2PjM1nmN1yNpjsisZAXnj67rfBRkyV3HvdXc1eB5IXQBBQWe7gVaCUBi239OhCHs=
X-Received: by 2002:a17:903:2281:b0:23d:eb0f:f49 with SMTP id
 d9443c01a7336-2430d22e961mr1599265ad.14.1755044343461; Tue, 12 Aug 2025
 17:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609191340.2051741-1-kirill.shutemov@linux.intel.com>
 <d432b8b7cfc413001c743805787990fe0860e780.camel@intel.com>
 <sjhioktjzegjmyuaisde7ui7lsrhnolx6yjmikhhwlxxfba5bh@ss6igliiimas>
 <c2a62badf190717a251d269a6905872b01e8e340.camel@intel.com>
 <aJqgosNUjrCfH_WN@google.com> <CAGtprH9TX4s6jQTq0YbiohXs9jyHGOFvQTZD9ph8nELhxb3tgA@mail.gmail.com>
 <itbtox4nck665paycb5kpu3k54bfzxavtvgrxwj26xlhqfarsu@tjlm2ddtuzp3>
 <57755acf553c79d0b337736eb4d6295e61be722f.camel@intel.com>
 <aJtolM_59M5xVxcY@google.com> <6b7f14617ff20e9cbb304cc4014280b8ba385c2a.camel@intel.com>
 <CAGtprH9x8vATTX612ZUf-wJmAbn+=LUTP-SOnkh-GTUHmW3T-w@mail.gmail.com> <b5ce9dfe7277fa976da5b762545ca213e649fcbc.camel@intel.com>
In-Reply-To: <b5ce9dfe7277fa976da5b762545ca213e649fcbc.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 12 Aug 2025 17:18:50 -0700
X-Gm-Features: Ac12FXxPSxg1yJOw-7Iewn9Frs8_mGpjq5ATxWJ9uJCejooYNNBU4ZpCUOOrKNY
Message-ID: <CAGtprH8Mdgf_nx4qEN3eqp4KqmrW9OvxYHHDJDV2xa7nmBnGbA@mail.gmail.com>
Subject: Re: [PATCHv2 00/12] TDX: Enable Dynamic PAMT
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Gao, Chao" <chao.gao@intel.com>, "seanjc@google.com" <seanjc@google.com>, 
	"Huang, Kai" <kai.huang@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "bp@alien8.de" <bp@alien8.de>, "mingo@redhat.com" <mingo@redhat.com>, 
	"Zhao, Yan Y" <yan.y.zhao@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 4:35=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Tue, 2025-08-12 at 15:00 -0700, Vishal Annapurve wrote:
> > IMO, tieing lifetime of guest_memfd folios with that of KVM ownership
> > beyond the memslot lifetime is leaking more state into guest_memfd
> > than needed. e.g. This will prevent usecases where guest_memfd needs
> > to be reused while handling reboot of a confidential VM [1].
>
> How does it prevent this? If you really want to re-use guest memory in a =
fast
> way then I think you would want the DPAMT to remain in place actually. It=
 sounds
> like an argument to trigger the add/remove from guestmemfd actually.

With the reboot usecase, a new VM may start with it's own new HKID so
I don't think we can preserve any state that's specific to the
previous instance. We can only reduce the amount of state to be
maintained in SEPTs/DPAMTs by using hugepages wherever possible.

>
> But I really question with all the work to rebuild S-EPT, and if you prop=
ose
> DPAMT too, how much work is really gained by not needing to reallocate hu=
getlbfs
> pages. Do you see how it could be surprising? I'm currently assuming ther=
e is
> some missing context.

I would not limit the reboot usecase to just hugepage backing
scenario. guest_memfd folios (and ideally the guest_memfd files
themselves) simply should be reusable outside the VM lifecycle
irrespective of whether it's used to back CoCo VMs or not.
