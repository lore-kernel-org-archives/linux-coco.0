Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EB033C5
	for <linux-coco@lists.linux.dev>; Mon, 27 Feb 2023 23:03:24 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id s17so4578656pgv.4
        for <linux-coco@lists.linux.dev>; Mon, 27 Feb 2023 15:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pg8jLCETrGkaL4VJFja7UtTlA/JJG8XOO2LhkC01X9c=;
        b=bsG+3jnQABLG/bbMBh9XjeX88bwj0SQ9Jx5uEJhWlMr1tpY8WoEdbEE3Pr3JQQF3RV
         b+MquoPqUZlakvxWscfmUggSBaVALuqQMwvDr24dwQoKpxZVB2dSHQNmH4SU2hpLiefC
         ZuGAMlK8YfKdgeFNOo5FJHkeS+wCud+0B1fFXpjfBtQVP3+BW522wIZurQCYhaPy4ZiQ
         Q/EiX/QQHYfJEINrAUJc1lnQQ7kTSEY3tllwzt6EmR7PgMn0G2EYR9Go7rhdjBV+AylT
         pF+mzkkoRGK20ybR508t9437vk5pwwk3DkToO7W29vcAEEgg8odGV/IpyBZ2OroTovFX
         Feiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pg8jLCETrGkaL4VJFja7UtTlA/JJG8XOO2LhkC01X9c=;
        b=kp29GbqWTOJwnj0DIOsyqZfL6dhPnWTN5x981/Rob15grOtbyWFyOlpiq2wUp5Aw+4
         mPL5YbE7icJp272KuPJdOYT2+qXmmC+U5E7JEZOqyEF6q9xNpzrJ40e7G0z2IkelDwuJ
         YsAfRU8cHzDhwGBFl5boTVtQy9Vvpr3uC/E9y9BOyi0vGY+F7UU+iPpHnxtWbjsA6LK5
         w70cppQ1MTTeCBoB/Rq2HY4rE9y7rB/KuldInan7z0oD/fcC7hA2JQnD5e1PXpUzy6HU
         5S2auoiaJnh9bT6pbziMkw6S8zLdNYg/GumBcDPkokmNmwbVxIbWqV0ueT43ymglUwyY
         ORkA==
X-Gm-Message-State: AO0yUKVrcu/MfDb6R17d0seENsRtMNJe1QJZnBjSZ2mR9gfHOzA+S0+L
	df1DHkcuVX2nmZ5xCNI49AOBMm5RBisUS0GqkrnZbg==
X-Google-Smtp-Source: AK7set/fd9hoddiJWkR+2I3PuNhNzBSMhE/0+J/LoWTvdfY2Nxv2qR4uxnorljhiprYWSqvXEZFZkgPE4WAPbMdg5aA=
X-Received: by 2002:a63:8c1d:0:b0:503:354c:41ad with SMTP id
 m29-20020a638c1d000000b00503354c41admr43761pgd.11.1677539003795; Mon, 27 Feb
 2023 15:03:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221113428.19324-1-bp@alien8.de> <20230221113428.19324-12-bp@alien8.de>
 <3cb5d149-699a-b649-1986-23d7f6783e6f@amd.com>
In-Reply-To: <3cb5d149-699a-b649-1986-23d7f6783e6f@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 27 Feb 2023 15:03:12 -0800
Message-ID: <CAAH4kHaH=Xpnq48LtwPra=Mhu=110oFzs=dv40vsZT7WOAvDqw@mail.gmail.com>
Subject: Re: [PATCH -v2 11/11] x86/sev: Change snp_guest_issue_request()'s
 fw_err argument
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>, 
	Joerg Roedel <jroedel@suse.de>, Michael Roth <michael.roth@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Peter Gonda <pgonda@google.com>, linux-coco@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Should this be?
>
>         input.exitinfo2 = SEV_RET_NO_FW_CALL;
>
> or make it part of patch #1?
>

This is something I'm not fully 100% on. You said that there's not
that many bits for firmware errors, so -1 or 0xff are fine by me so
long as neither are possible results from the firmware. I don't recall
the details on that, so if we go back to 0xff for SEV_RET_NO_FW_CALL,
I'd want a clearer explanation for why 0xff is sufficient.

Apart from the other comments from Tom which are a matter of style and
not semantics,

Tested-by: Dionna Glaze <dionnaglaze@google.com>

-- 
-Dionna Glaze, PhD (she/her)
