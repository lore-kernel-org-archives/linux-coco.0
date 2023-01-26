Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9204291A
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 15:13:26 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id bp15so3429098lfb.13
        for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 07:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hc6ZwBnEHfllxJYiT753cJcnxMfaeJjttvRk6qoxRnQ=;
        b=F1wBM/+4TMypuSmQSIBzjeRJFFyaHQ/0qchQXZcr/y1UPvy/oKavxAnQCmS3lMrKM7
         LvRmeNXxA8/YJyJtwlt+EfqApeBOS0bN+KqQTMl4fzvJg+5okFap0FyU2HcYivlwX858
         qJRjg/XQg2t84NUMvaqnxn9c8QaDbakgQCqK9jS+Qq9WsTcsvio+93agkPl9RN5xn2LE
         G3P1osGYD4WVgvIHIPPRZ2XNTdw9DorvlnCrVtwQLAeiTJ3qxPQdPyOuVQeR9cXBhHo0
         cqF61Q7e7j9g4UPI+q8h+AKnriHt2Ynt2P2a8DNsuK9vqUgNOIitUN4UYT/Yjc31D9Tn
         I/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hc6ZwBnEHfllxJYiT753cJcnxMfaeJjttvRk6qoxRnQ=;
        b=MTB86cmSOS4jl+lTBJ/BXK4R/T50fOYN4LNs8+aqx16BQd/YQx02Z4uamKxeaoacer
         m38lb7sMgneLKkOXOUvgyjRZ80pwx0qmxLPPaHa+oWEne00HPShm17uXRoQLG8lPbPAI
         T1BT8r6D6yaqKaTbFUtTkRbzKv8SyvhTc/8bJwzLFPokCvxWYmdye9QeiXAFCAZAX4zV
         9JX1a1f5waAwWqO7XxcdFM+UjE3J1eu5KHHldhTjsQZB4kwuRqDjDiZ9+YzLN+Xq4NVP
         HI6CDplfCFQnhHN8HKDQZv30AoYDwaU790/jmaOb7Nfyyp420/j9i7loATgl3GUME6R1
         2aNQ==
X-Gm-Message-State: AFqh2ko1oHnc+S5rxGg/9EiLi0ZNaZBF95FcGDjbM0Y4z1mMZHtb7KaV
	myVXiL8vnpMCk+td0fHuIMFYbM53tLWK7LOb1jE=
X-Google-Smtp-Source: AMrXdXuXLi2sgAvR7DVwDeHXnP46pNcE98/obdzUFlb01kXRVZpGWgVhlaA5MI4hdvDdc/Mj43YUXtaznXztN/mcpBk=
X-Received: by 2002:ac2:5596:0:b0:4cb:334f:85ef with SMTP id
 v22-20020ac25596000000b004cb334f85efmr1675146lfg.67.1674746004845; Thu, 26
 Jan 2023 07:13:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com> <Y9Ex3ZUIFxwOBg1n@work-vm> <Y9E5Cg7mreDx737N@redhat.com>
 <CAFLxGvwHRK3vyXiCv5ELvrDSEkcDgV5c6pNnWgWhcATfp1dedA@mail.gmail.com> <Y9KVHnHnig4jwNPx@work-vm>
In-Reply-To: <Y9KVHnHnig4jwNPx@work-vm>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 26 Jan 2023 16:13:11 +0100
Message-ID: <CAFLxGvyMncqjkEXiOqenQu+rZW46RP7UorXs36+awmgnBxTGhA@mail.gmail.com>
Subject: Re: Linux guest kernel threat model for Confidential Computing
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Reshetova, Elena" <elena.reshetova@intel.com>, 
	"Shishkin, Alexander" <alexander.shishkin@intel.com>, 
	"Shutemov, Kirill" <kirill.shutemov@intel.com>, 
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>, "Kleen, Andi" <andi.kleen@intel.com>, 
	"Hansen, Dave" <dave.hansen@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Wunner, Lukas" <lukas.wunner@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, "Poimboe, Josh" <jpoimboe@redhat.com>, 
	"aarcange@redhat.com" <aarcange@redhat.com>, Cfir Cohen <cfir@google.com>, Marc Orr <marcorr@google.com>, 
	"jbachmann@google.com" <jbachmann@google.com>, "pgonda@google.com" <pgonda@google.com>, 
	"keescook@chromium.org" <keescook@chromium.org>, James Morris <jmorris@namei.org>, 
	Michael Kelley <mikelley@microsoft.com>, "Lange, Jon" <jlange@microsoft.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2023 at 3:58 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Richard Weinberger (richard.weinberger@gmail.com) wrote:
> > On Wed, Jan 25, 2023 at 3:22 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > > Any virtual device exposed to the guest that can transfer potentially
> > > sensitive data needs to have some form of guest controlled encryption
> > > applied. For disks this is easy with FDE like LUKS, for NICs this is
> > > already best practice for services by using TLS. Other devices may no=
t
> > > have good existing options for applying encryption.
> >
> > I disagree wrt. LUKS. The cryptography behind LUKS protects persistent =
data
> > but not transport. If an attacker can observe all IO you better
> > consult a cryptographer.
> > LUKS has no concept of session keys or such, so the same disk sector wi=
ll
> > always get encrypted with the very same key/iv.
>
> Are you aware of anything that you'd use instead?

Well, I'd think towards iSCSI over TLS to protect the IO transport.

> Are you happy with dm-verity for protection against modification?

Like LUKS (actually dm-crypt) the crypto behind is designed to protect
persistent data not transport.
My fear is that an attacker who is able to observe IOs can do bad things.
