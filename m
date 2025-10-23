Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E443D23505E
	for <linux-coco@lists.linux.dev>; Thu, 23 Oct 2025 20:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761251527; cv=none; b=gnWDvWD7ML8lrgNzN0bu2uWiNesTGHx1vC9hGcfSmV7RIphq2hFKeI2G13192zCN4blz9b4jjA0bcUFOcow7XLJneiRbxKoh1hCmycO9ymY26+OmWEKA5YmkWsBESLj9xeeoYCl/jPJrnXl4hyDkZeBfsVy/3Zrr7srQ7/2ZUKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761251527; c=relaxed/simple;
	bh=236312neeVJG7LyErAG0496ByhyKDmHLJg+2zCLiD1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M4xs8Y3QneEbpjzzZ+kRI6rUq4iIjzd+Cje1dCeiNXDqYUuXKqz7XxEZn0sGlnhT9C2B+jCMsXsCDybx6ZR1of+ESZP5QRSnCj57XiqieWuobj70cet+mP5bnltuC+4++8RXRbj6WEu8qfXxf0sLe+SiJCIIsBXQIqqwAvO5euM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oe1ymEKL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oe1ymEKL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-290d48e9f1fso15785ad.1
        for <linux-coco@lists.linux.dev>; Thu, 23 Oct 2025 13:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761251524; x=1761856324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3GbqcC/WnvG2wxuPd40YtqR08PLkAH1Q85YMJct8AQ=;
        b=oe1ymEKL7UMX7hXHxiuN09H/oq3XJ0oOgLNxjZyDk5pZ8VFw9SB896gh9RXv2FvHAW
         znFQTUR1RvyB37JLivOgdRoSIaRl5GisRAh5Fpg8god5CP4QJ45gxQaYMwO4mfZSHGtC
         Z7lMInVAIiAYx9A3Nw3NWMFFbx3dD6SULjSPL4sK7BeKVyClqR8OYq5muPWasFyJSktV
         PxTXiST/GVxbqW6E1ctHXCLG/2DcJIUIuitUlc7ruXJHVpZql+QU6JoOFyg6uJnXNl5m
         n93eNiv/U5yS1HOXrfXrPYYZIPW4mYxqSg85NrkoqRbvspxeclyZLfQNQOJvnLLsBxRU
         snsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761251524; x=1761856324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3GbqcC/WnvG2wxuPd40YtqR08PLkAH1Q85YMJct8AQ=;
        b=cUN68pjhhnua2UjclnpV1siu7tezcFSDwE/rvRgOUAjfkU6/gAzAXt4e1YeEdPAO7u
         GQ9aA9mX7Ta0jpI7m0soduZopEb3bhgls2kRUCAt7vYgLNXVIlqAiuTbRv9cpnrfduaZ
         sBQNafXlJpb5oFO4Fy58JnQoArO3FB2anNED7n3fHgPc7Z8ihDAcBSZVWPrM+WZUlBEP
         ueJlNnhOtt64oXisLySTnC/uhiyz0NDM2JDRxgw6Wn2KWxijxdaqYlqRDo1UK5LWxVdF
         pJUdotCjAu64V+NTM3HS5GPDSMT7Z/dr1mztbmDxyYbVGM7S/gUPyNk0dboRxuP4Evth
         DuvA==
X-Forwarded-Encrypted: i=1; AJvYcCXrD1drmnz2BYnoyJ3fYevUBPFLxrxYMlnSqiiDfaHSFGDjzfH0EA+Moi/4CR8vc+Krog87vPWIvxLv@lists.linux.dev
X-Gm-Message-State: AOJu0YydtPWuTQUjCzvwz6hrDERjr8rY2Lfm1gfnEvaiPF2xtRJtDjV8
	lS2hOkOry6uzBR1AbaOULPBxlPs+IgbLqTJ1iGHXxnLasahx6QVhwi2empPVHJUTO5HFW5ftML0
	61VMp03Biuu/hZ+vQ43WcK1QwyxP/YBz/oJiXLhbT
X-Gm-Gg: ASbGncvOa27gH3r8zD1l8nNoDYeFEuFn33EH2E2J+WszJ+2Ktu5l6bPhwr7MOvguGUM
	K2FdO79i6EqUfToc9unVIzKzzZUYCA0QOxrCUeP6YzYK/CcKzT/E78vT+Bi4LUWJZ21LQLgMWmP
	DpQflN09+d7JJGmCp5hDh6cIjyK9eV0R5XbeubJHcM7/JbL7B5GbtFZb8RdkBuLMX/pUKZfG26k
	kONPVN8uhz3WQMzHGbMKMzWS028hmGFiJ3mj7UWpgTDOSZj4Ykz4TqoWE7u+gqrzngTMNg+vazs
	jmTwhBHqCUaZb0QhLb0Z1Q0a98qoHyHR0YrRxOU=
X-Google-Smtp-Source: AGHT+IFqYTO9OhaGbvTF+gc6PUoCmonC3RLRYQV6NT0QUylhUdb10TIEy7SswDyj+FbJvNKxFB7OdRyEx1bzxgb75ys=
X-Received: by 2002:a17:903:32c5:b0:291:6858:ee60 with SMTP id
 d9443c01a7336-294894eb3f3mr913195ad.4.1761251523468; Thu, 23 Oct 2025
 13:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001025442.427697-1-chao.gao@intel.com> <CAGtprH_FzXjnC0Rbctpvm2_kqAAnUOfnaT4885fBiAi7s0jcXw@mail.gmail.com>
 <IA1PR11MB949522AA3819E217C5467B51E7E8A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <5b4c2bb3-cfde-4559-a59d-0ff9f2a250b4@intel.com> <IA1PR11MB94955392108F5A662D469134E7E9A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH96B5K9Hk5h0FgxSUBa-pik=E=dLrO-4oxx76dxb9=7wQ@mail.gmail.com>
 <IA1PR11MB9495BB77A4FAFBD78600416AE7F6A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH-h_axusSLTWsEZ6QoxgmVs0nVknqNJx-iskpsg_qHKFg@mail.gmail.com>
 <aPiEakpcADuQHqQ3@intel.com> <CAGtprH8q5U6h3p5iDYtwRiyVG_xF8hDwq6G34hLt-jhe+MRNaA@mail.gmail.com>
In-Reply-To: <CAGtprH8q5U6h3p5iDYtwRiyVG_xF8hDwq6G34hLt-jhe+MRNaA@mail.gmail.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 23 Oct 2025 13:31:50 -0700
X-Gm-Features: AS18NWBm1eSgqBL9wFCx_Q-96MkmMC0i2iF8YLZuC-hfgkp5DIWbNEmuyET8Qgs
Message-ID: <CAGtprH9bLpQQ_2UOOShd15hPwMqwW+gwo1TzczLbwGdNkcJHhg@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: Chao Gao <chao.gao@intel.com>
Cc: "Reshetova, Elena" <elena.reshetova@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, "Weiny, Ira" <ira.weiny@intel.com>, 
	"Huang, Kai" <kai.huang@intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, 
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "sagis@google.com" <sagis@google.com>, 
	"paulmck@kernel.org" <paulmck@kernel.org>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 8:42=E2=80=AFAM Vishal Annapurve <vannapurve@google=
.com> wrote:
>
> On Wed, Oct 22, 2025 at 12:15=E2=80=AFAM Chao Gao <chao.gao@intel.com> wr=
ote:
> >
> > On Fri, Oct 17, 2025 at 05:01:55PM -0700, Vishal Annapurve wrote:
> > >On Fri, Oct 17, 2025 at 3:08=E2=80=AFAM Reshetova, Elena
> > ><elena.reshetova@intel.com> wrote:
> > >>
> > >>
> > >> > > > ...
> > >> > > > > But the situation can be avoided fully, if TD preserving upd=
ate is not
> > >> > > > conducted
> > >> > > > > during the TD build time.
> > >> > > >
> > >> > > > Sure, and the TDX module itself could guarantee this as well a=
s much as
> > >> > > > the kernel could. It could decline to allow module updates dur=
ing TD
> > >> > > > builds, or error out the TD build if it collides with an updat=
e.
> > >> > >
> > >> > > TDX module has a functionality to decline going into SHUTDOWN st=
ate
> > >> > > (pre-requisite for TD preserving update) if TD build or any prob=
lematic
> > >> > > operation is in progress. It requires VMM to opt-in into this fe=
ature.
> > >> >
> > >> > Is this opt-in enabled as part of this series? If not, what is the
> > >> > mechanism to enable this opt-in?
> > >>
> > >> For the information about how it works on TDX module side,
> > >> please consult the latest ABI spec, definition of TDH.SYS.SHUTDOWN l=
eaf,
> > >> page 321:
> > >> https://cdrdv2.intel.com/v1/dl/getContent/733579
> > >>
> > >
> > >Thanks Elena. Should the patch [1] from this series be modified to
> > >handle the TDX module shutdown as per:
> >
> > Hi Vishal,
> >
> > I will fix this issue in the next version.
> >
> > The plan is to opt in post-update compatibility detection in the TDX
> > Module. If incompatibilities are found, the module will return errors t=
o
> > any TD build or migration operations that were initiated prior to the
> > updates. Please refer to the TDH.SYS.UPDATE leaf definition in the ABI
> > spec above for details.
> >
> > I prefer this approach because:
> >
> > a. it guarantees forward progress. In contrast, failing updates would
> >    require admins to retry TDX Module updates, and no progress would be
> >    made unless they can successfully avoid race conditions between TDX
> >    module updates and TD build/migration operations. However, if such r=
ace
> >    conditions could be reliably prevented, this issue wouldn't require =
a
> >    fix in the first place.
>
> TD build operations are much more frequent than TDX module update
> operations. Retrying TD build operation will need additional KVM and
> userspace VMM changes IIUC (assuming TD build process needs to be
> restarted from the scratch). IMO, it would be simpler to handle TDX
> module update failures by retrying.
>
> Admin logic to update TDX modules can be designed to either retry
> failed TDX module updates or to be more robust, adds some
> synchronization with VM creation attempts on the host. i.e. I think
> it's fine to punt this problem of ensuring the forward progress to
> user-space admin logic on the host.

Discussed offline with Erdem Aktas on this. From Google's perspective
"Avoid updates during updatesensitive times" seems a better option as
I mentioned above.

To avoid having to choose which policy to enforce in kernel, a better
way could be to:
* Allow user space opt-in for "Avoid updates during updatesensitive times" =
AND
* Allow user space opt-in for "Detect incompatibility after update" as well=
 OR
* Keep "Detect incompatibility after update" enabled by default based
on the appetite for avoiding silent corruption scenarios.

>
> >
> > b. it eliminates false alarms that could occur with the "block update"
> >    approach. Under the "block update" approach, updates would be reject=
ed
> >    whenever TD build operations are running, regardless of whether the =
new
> >    module is actually compatible (e.g., when using the same crypto libr=
ary as
> >    the current module). In contrast, the post-update detection approach=
 only
> >    fails TD build or migration operations when genuine incompatibilitie=
s
> >    exist.
