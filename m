Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819462036EE
	for <linux-coco@lists.linux.dev>; Wed, 13 Nov 2024 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731523236; cv=none; b=FwlrWaG3qoSN0d56RsFfD+eP3+fNSS2h2jvn6dEedWN9uYYiH9Nk0LTAcZazJHpocTblkt4hgPwu/YeDLfK6ZY+ijte10xRwYecapxrJmJ2ufIi/2n8LFXxWN6jbgpIhOpkWeKiKLJbPStrEHTU3fxQ9h3e5OpQm+SPhBY6PPsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731523236; c=relaxed/simple;
	bh=0IhfgvbUE1b0rqbeuty/d2sa4owmpif+IBjtytGdNa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCWosgAkjkWRtXnic6aDwchNNN5mL1TJq/Z7aJq6HjiAh8qUGKiUCfkF75ovXmiP7sFQwBrTAr5I/ycyGEKX8WvdwpY5fk3HkTOijsPjAJ/99fJglZ0Iimq7V6KLYHvTL58HdXv72FKGERf0TSs6jcvKymuDJWqEPoMTounIyJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aRroSYiJ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aRroSYiJ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso970075266b.3
        for <linux-coco@lists.linux.dev>; Wed, 13 Nov 2024 10:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731523233; x=1732128033; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IhfgvbUE1b0rqbeuty/d2sa4owmpif+IBjtytGdNa8=;
        b=aRroSYiJ6V7JqK6J6CcO21+/8ov2o1U5tTejure2pOSZRzAbwH2Y47tN90MRzraFrh
         n14gb3Hvd2tshPHnpYjIVI8lxtuCi9Y8Oy6/LkRhyh03wG8RHSgR/H/X+KXk3Ju6Bwgv
         ithRydimi5i881CQKelGAxEvGgggDUOONLcFjAjJCCgbKOukSyjG3YZhbsGB/TlsqSjH
         mag/4Ks1Pfd4BTrZxg553R8f+Pu0MYNHRBbC+1JmqVpjqtjB8CBsVssnDwc8pLPyLXFp
         qqLo9pPjKhUKZONcu7zOfttgxjiyebzoT6nYyVbSzDUYxYbje0/246IYXacGRDkpIURp
         nBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731523233; x=1732128033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IhfgvbUE1b0rqbeuty/d2sa4owmpif+IBjtytGdNa8=;
        b=l9qPfo88pG1EezGluTuTIcseSK/3lzgN0n5pW/dhFqrWz/xmJSsmlOgFJpp70SWV32
         z+V421Cx7Fdo45jrE5RzoNeYsbwXnws0/X3DIRPw0o3uRscZeNVt0KFT6xyDMS302hPQ
         MzuSI1EcCQE8mD8X7SRjhIqWiYn+oaqbv43xQm/e+h8QpsRlxzZU66RZbAgz0hceao63
         Nx79AblyZoyeloiBmWso5qohb6G8iT7GmirBraU9cTpI6os78H8MKgTRDB42zfpf8Dxt
         J5jXdbF9Mh278d3ERa/hajquu4KfE/wrAP27c02p7shojOPSozUfLwiPasp6tizQY1R3
         312Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrA4YrF47ZBrXEOnML795SDfsd6+VYfWwefVGxixuz2WupMeliT6qA/HjfO9xMuHUCOOWKjYXiIYPK@lists.linux.dev
X-Gm-Message-State: AOJu0YxOEuWHZ7A6dGUBGz9cV4qW1+lhoVBbClbIadeg71Znowh/gDwr
	y/ymu7BaaOLdW9wT5XP5gmxvGc/3t//NGniKL5NayZukJ4z4dMR03wjlGU1c6Ilj4CUZfI6jI10
	zdTCFDbylbNB4IpCu8lCXIs461zI7Gy/z5Ybm
X-Google-Smtp-Source: AGHT+IF5wjOJaBPEZ4nz56CrqKN7iUic7DwNHhdRnoDYCM9sCmx+P0GttaB1YJaUrHtYzGBCXPKk9iwPx36odrX1SxA=
X-Received: by 2002:a17:907:7b88:b0:a9e:441c:f74d with SMTP id
 a640c23a62f3a-a9eefee456bmr1941100066b.16.1731523232630; Wed, 13 Nov 2024
 10:40:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241112232253.3379178-1-dionnaglaze@google.com>
 <20241112232253.3379178-4-dionnaglaze@google.com> <6734119c1c9a7_10bb729471@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <6734119c1c9a7_10bb729471@dwillia2-xfh.jf.intel.com.notmuch>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 13 Nov 2024 10:40:20 -0800
Message-ID: <CAAH4kHYJ5769aMNqu23KhEqatV2Ks58zmkP1ynhDh_uvEb8mtQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] firmware_loader: Move module refcounts to allow unloading
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, linux-coco@lists.linux.dev, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Michael Roth <michael.roth@amd.com>, Alexey Kardashevskiy <aik@amd.com>, 
	Russ Weight <russell.h.weight@intel.com>, Kees Cook <keescook@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 6:40=E2=80=AFPM Dan Williams <dan.j.williams@intel.=
com> wrote:
>...
> However, I think the fix is simply to remove all module reference taking
> by the firmware_loader core. It is the consumer's responsibility to call
> firmware_upload_unregister() in its module removal path and that should
> flush any and all future usage of the passed in ops structure.

That would suggest the addition of the refcounting in v1 to fix a test
means the test_firmware is wrong?
https://lore.kernel.org/all/20220421212204.36052-5-russell.h.weight@intel.c=
om/

Adding Kees in case he knows better.

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
