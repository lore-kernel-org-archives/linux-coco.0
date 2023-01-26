Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B02A256A
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 14:23:50 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id y9so2062017lji.2
        for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 06:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EM8B7vfyD5Py/MB3Opt1I4SCriH6T8vAGD94Cbdc8VI=;
        b=HtAcpybS0NIBL3fotWhYtfxr09jYWtTCVGDxlVw3etdAwsOY2pjTKteiChBYWFp25c
         M5xTsH5caJThm3LbLj7yew7ap5AZqvT6L6DxpUnQolNHQS8N9o82kynnDVByw+X+xHK0
         ZZBNOcSFhzoDKJvyACDcf1mBUrzQ2g3JjXPOtcQaWmmBl7/8obn8xFaSUKleGLMM0tFz
         v3zq82JC5Z76pJsk2JqaJu9LlYqdxUuY8h7ek8A35prxW2OiOkytY7H7lLytjXKmV9R6
         BGePHVznHtAfIvsawcG4By8wGYMpD7WVd65SaxJqX3GTfShCzwyOsRmEF8gzP2Wfq3NH
         i0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EM8B7vfyD5Py/MB3Opt1I4SCriH6T8vAGD94Cbdc8VI=;
        b=KNIvBYV2tIN+fZFJO5aAUyvYW8lCQJXodIAcxnq/lrorEXvIfqSUjzHT92LtdfnCTz
         /6ABorm+dpNEndSYmG6zg+8cR3vvLGbZbFWF0MvhMWxgHXB3poe+x4Gb9E226zJWBKNc
         dnPRVoAMT9QlNP2I3uy3yKolhJpn2fMrl1KmyHgzT9zZ4pdsIiuNDKmHtiJIdJiyAemp
         m8YsiUdE8CEzxUMncJtgSOXKvFzzZoD9azVi+KboAHEyyZ7lzD76ECMVoxYzCJNjHulb
         94fhyTRQh1OLHWPdoLiIVbiMptC+e49JEHO389ggkB+wQ/LkSUPahBrhzzvUBIZxN3Pk
         uoBw==
X-Gm-Message-State: AFqh2kqEDklOKZPySczCqr1TXq1fU+K2Zydki+c2tbcAe4ejlRjTh0hL
	17xzP2ZTOez8Kip4mTUHc4mYYRQLKR1SCrJVOpo=
X-Google-Smtp-Source: AMrXdXvbWzE9Hn4V0NJC8nCCHk4bKSwM/JdIdOkQ/rCSUe75fkT5Wt2Z/1pvBXsidgROqLCy1NgC8HERP5GUCepO1X4=
X-Received: by 2002:a2e:9b56:0:b0:279:7164:a0aa with SMTP id
 o22-20020a2e9b56000000b002797164a0aamr3380935ljj.318.1674743028156; Thu, 26
 Jan 2023 06:23:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com> <Y9Ex3ZUIFxwOBg1n@work-vm> <Y9E5Cg7mreDx737N@redhat.com>
In-Reply-To: <Y9E5Cg7mreDx737N@redhat.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 26 Jan 2023 15:23:34 +0100
Message-ID: <CAFLxGvwHRK3vyXiCv5ELvrDSEkcDgV5c6pNnWgWhcATfp1dedA@mail.gmail.com>
Subject: Re: Linux guest kernel threat model for Confidential Computing
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Reshetova, Elena" <elena.reshetova@intel.com>, 
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

On Wed, Jan 25, 2023 at 3:22 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> Any virtual device exposed to the guest that can transfer potentially
> sensitive data needs to have some form of guest controlled encryption
> applied. For disks this is easy with FDE like LUKS, for NICs this is
> already best practice for services by using TLS. Other devices may not
> have good existing options for applying encryption.

I disagree wrt. LUKS. The cryptography behind LUKS protects persistent data
but not transport. If an attacker can observe all IO you better
consult a cryptographer.
LUKS has no concept of session keys or such, so the same disk sector will
always get encrypted with the very same key/iv.

--=20
Thanks,
//richard
