Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3244407
	for <linux-coco@lists.linux.dev>; Mon,  8 May 2023 16:28:52 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1aaf702c3ccso837855ad.1
        for <linux-coco@lists.linux.dev>; Mon, 08 May 2023 09:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683563332; x=1686155332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0GBvgtXFzk01LDZ1sY2ABtb7ww7m6vPpluzRFNiPXw=;
        b=tv9iI8CG7ntW3IKhCV/VN3+wVynBZOjHP3YJI9eMdGvtEHsy1jOqV3ANQAqltiAkH/
         7cfCs8p5TGBaJ3F4LEJC2j19+sR4DnSsnZvo22Y3Qp6bymAS/OlK2IRaJts4rw2PS0uh
         2We2dSgsFozJYcjqEDPFL7wEfQ3lJjUYMnMqSta5XiYJiHYRzE1J+sS2oopyG+bLGiYl
         4QzPJUELpPK1Y3hUWQ8cBAVlteBK/hbq2DcFiDbEf7Dsum5EkdVjr+89ZvFVmqWT3WRE
         etZ4DyddSynWkR7226dWdvzcUvXVWu3xESGYHgTwaCriI6V2awwBldwypWRClgG25glK
         fz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683563332; x=1686155332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0GBvgtXFzk01LDZ1sY2ABtb7ww7m6vPpluzRFNiPXw=;
        b=Chqfn96dF+jcZ3ETiZqvA+2nY0jW6H04WNwyizw24KepVc8i/Sw9TyNUIoFnwhXL2E
         HaRIudOiKl0v8WdW9eYs/x6+YC8APArTR+hhXOOM0WXVqWZTKUYrjBbdfhpOcn38ZXEN
         PUoWSzlqoI7C4KS0eVFlwcd44d4tPm3pXsBXmzaaghzI/sNYxBREDpiTaBbbk6clran7
         3BUynXGHYGcNBx3V5t6PPvn30d+wN+zWjv6C4nE35Ekk6hASHei8q68O4jhCdxqTa/pn
         XO5IZcWxgy7apxLR2J6ILNTeQAAI84RRqMFaqog3l8/2Zae72og9+Q+mPlkKk+HR8/0x
         oPQg==
X-Gm-Message-State: AC+VfDyknldXHfhG//O71p59+Fd7dgd7u/UgZUpPUNcmg/p8yJX2xqL+
	jwW6nbNn8MfuGxKV/4PiC+tcKPvaL3lFiMyDnP46KA==
X-Google-Smtp-Source: ACHHUZ61b1aYs3otH34bwS5pkLJmeVkvB3Lq0HnWBktvEzz6q6mK2mNoHwhqw0+OIMsNF03SzRyeKABTo6kQnyoR2AU=
X-Received: by 2002:a17:902:ea07:b0:1a9:bb1d:644 with SMTP id
 s7-20020a170902ea0700b001a9bb1d0644mr538152plg.12.1683563332251; Mon, 08 May
 2023 09:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZFjL0oXu6NjYKCXl@suse.de>
In-Reply-To: <ZFjL0oXu6NjYKCXl@suse.de>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 8 May 2023 09:28:40 -0700
Message-ID: <CAAH4kHYpyeu-UFBYL5mXnS0xQh_rD039FgMz=Qfa=ruCUsVL_A@mail.gmail.com>
Subject: Re: [RFD] COCONUT-SVSM project governance
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm in favor of governance models that strongly value transparency,
good-faith disagreement, and a set of community guidelines that both
has enforcement power and accountability of all parties involved.

On Mon, May 8, 2023 at 3:15=E2=80=AFAM J=C3=B6rg R=C3=B6del <jroedel@suse.d=
e> wrote:
>
> Hi,
>
> As discussed before[1] I'd like to start a discussion about the future
> governance of COCONUT-SVSM. Bottom line is that the project should move
> from a single-maintainer, SUSE-driven project to a multi-maintainer
> model driven by the community.
>
> [1] https://lore.kernel.org/linux-coco/ZFJTDtMK0QqXK5+E@suse.de/
>
> Some of the things to discuss:
>
>         * How many maintainers? (3 or more?)
>

3 is a minimum I think, with at least 2 entities represented.

Technical software repo governance I think should follow the OSSF
Scorecard [1], e.g., you need at least 2 people to approve a change
(author + human reviewer), enforced by a repository security setting.

>         * How to select them (by contributions and trust in the
>           community? elections? If elections, who can vote?)
>

I think that an RFC process as means of democracy around policy
changes, maintainer list changes, and substantial/breaking features =C3=A1
la the Rust-lang project is a good one to emulate.
Particularly contentious RFCs should generally be treated with a great
deal of caution, so following a good-faith revision process shouldn't
be too onerous.
If an RFC drags on to the point of "calling the question" [2], I think
you'd have to hold a series of community town halls in APAC-, EMEA-,
and Americas-friendly timezones to send a contentious RFC to a vote. I
don't like online election systems without some kind of
group-membership restricting casting multiple votes.

To avoid situations of "why wasn't I consulted?" [4] you need both a
minimum length response period (e.g., 3-6 weeks), and mechanisms to
shorten that time in the event that there is no hesitation for
adopting the change given at all, and that you have a majority of
active contributors (has engaged with the project in the past 180
days) weighing in. I don't imagine the shortening condition getting
hit often except for extreme circumstances.

Certainly to make this work, you need to have to have existing
maintainers stick to the selection criteria for requiring a change go
through the RFC process when the contributor hadn't elected to do so.

>         * Regular changes to the maintainer group?
>

I think again an RFC process to amend the maintainer group is
sensible, so long as following community guidelines are treated as a
sort of constitution to remove members in protest due to unneighborly
behavior.

>         * How the group makes decisions on merging contributions and
>           the general direction of the project.
>

This is where the notion of a working group comes into play, such as
language or core library evolution working groups of the C++ standards
committee.
It's up to maintainers to decide if it's time to split
responsibilities into different working groups in order to avoid
expensive meetings that attendees have little interest in
participating in.

> And certainly more questions which I have not yet thought of. So I'd
> like to invite everyone to share their thoughts and opinions in this
> thread so that we can develop a way to an open project governance :)
>

We don't want to repeat the unaccountability mistakes of the Rust
project that led to the moderation team quitting en masse.
I think eventually the project ought to be donated to the Linux
Foundation for impartial-ish ownership, but when it would be a wise
decision to do so is something I think lawyers will need to figure
out, since there are so many rules about corporation collaboration
outside the context of a third-party foundation.

I think the sigstore.dev project does a good job of running regular
community meetings and publishing meeting notes to allow for regular
collaboration across institutions.
I don't think we need to set that up until there's a good reason to
take a discussion off the mailing list for higher bandwidth
communication, since who needs more low value meetings?


[1] https://github.com/ossf/scorecard
[2] Robert's Rules of Order
[3] https://www.redhat.com/en/blog/understanding-open-source-governance-mod=
els
[4] https://www.youtube.com/watch?v=3Dm0rakUuPXFM


> Regards,
>
> --
> J=C3=B6rg R=C3=B6del
> jroedel@suse.de
>
> SUSE Software Solutions Germany GmbH
> Frankenstra=C3=9Fe 146
> 90461 N=C3=BCrnberg
> Germany
>
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew Myers, Andrew McDonald, Boud=
ien Moerman
>


--
-Dionna Glaze, PhD (she/her)
