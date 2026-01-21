Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B2745348A
	for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990707; cv=pass; b=BlQ4jktJFK+JjRWqEynAyqerX8JQz6fAFG/qhxdvkqSdp910wKjjJFBLkuy7/Jr7YgYwQVgNthRMqzMSsDbU1bJ4I/qIs/jQCK6UkUsX2k3Cph3n7Tdk4iEYOnAspl+0zdcD8DZ2nYjPNwhwGCcv0twcDOX8UL6g/Afg5ENSMTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990707; c=relaxed/simple;
	bh=RtKTimol0QeINAq5yn88UWXfeIoqKEGhHDmj1Cwv6F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Au9RbH9Iuft/xD8ErJL0ps2h4feYUWR2LxmMTCC7duyBWEZYPVk9wHEfr8LpcPNqBgKAcJJBh38DVuYK2f3bwqQnst+OCwC4C4ZRdxIHe6PWPV+JZlJvCXGO3wdy/6eQ+dYhtuCz7aOHvbZgw1MaRTyMoQCXOuK9PlSupuRoahg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0eIfNtA; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0eIfNtA"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-382f4aa8dd1so61337501fa.3
        for <linux-coco@lists.linux.dev>; Wed, 21 Jan 2026 02:18:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768990703; cv=none;
        d=google.com; s=arc-20240605;
        b=E0uVfZCFvMRsTGrN3jYilZbvqxhIrYKquF/QcihervAcCWTzPAsr3uiTi8jpnl2AUd
         1G7xNTYdUw58MukL8hRG4jJjhfKJe0pUTLnZrTEUho/uUs1rCZzbdlybot6NEEXo/Pi3
         Uuvg+TCLZ+lf0ILVXnjO39+K/qXabggHqxch8o4l2BcqE77UjmRNbEWbEjyB/G4HSfTh
         kR4IbaqzyoH7dvVrBHPL1YXhWY6EDxAK4tieOBtz1yEk6m3sjuXInml2SEM7dpUT8w/a
         2wZIc6rIPi0K0iHrk16P6hAsYZ8bApFzd1icOy/8PWn6XYDrJNK0xFPjwSc1ji6Q8qS+
         tGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RtKTimol0QeINAq5yn88UWXfeIoqKEGhHDmj1Cwv6F8=;
        fh=L2brmygLtwKn9CRq9Cg28k3iLHdu9KQ8E6OxmyNRbEA=;
        b=SehD+8eYOybqsibh0mSmX1kz/TensgjW7rZs5leyByf/Jx7MmA6TPV0BQzeL8u6Duc
         FAgy4psCxxsaxZFkohmN5mYyLGwfqbsN4H2ZRTajpjFs5jz3GoCkiMw3qAM99Ln18lKQ
         kh4LhhKXro7tdQ/b4PaqU9332nWi28E2LCmq+3btjU3BTqR1V9oypNeEb1UJtqyZmNff
         c2G/o83v5gA9ruawkX65H4wUrLROgGZbBJp94HMFZgawTUW5keuhPMUIMqctfVoXSAFY
         l+Tarz2XGRUmDFBcITl8M2W1oCHzkIB0StDIpcLlLJYXOZqUBYz63uUcXQuN+o64vJ0B
         KCKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768990703; x=1769595503; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtKTimol0QeINAq5yn88UWXfeIoqKEGhHDmj1Cwv6F8=;
        b=l0eIfNtAGLF6PyjQZ6z9BgNyJhldR4EJTDG4bQWHPoQdeMDhzH83aWIOcz8SJTH/h3
         jpNKS4XyTxi0J9YWZmZOKH/CD8ECZBdK4iEoZxDqsJMdC0YWteNepOCjtM0g6e21fMq+
         eqIwX40G8HzkQHUUsx0Jq72UZopyCgObyy6B8oVbWYjgirIPg1yjECBJ4UoxCX3xZyqH
         wmPltnntgMzg1dB0ghF8QDUMfSgBM5CODr1JcLY2yPNspDTb6hFjv7bh3Z/0t74uW4NP
         vLz3gI4pwqLgPTfu2Ifqkt3ETwLaKzwJ/VGjurV0i/ReDsSr84yCapSXRolt+3w6rt/M
         Fl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990703; x=1769595503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RtKTimol0QeINAq5yn88UWXfeIoqKEGhHDmj1Cwv6F8=;
        b=vTkPe11TlJG3lnlTt3td0nAhm6+8eIzDSRDZpRLjNPx++lOdbwcR566Jo8i9TFBgym
         h851ZnTGMWIOv1Z34u6PZ+9vRZ5NuiIkfr8BG/y1tUMQ5EzIY9N2y2TXGRETsplRY7uZ
         2aJrNr82xldin65kd16IPJHTXB+zvp0G2kmZYAlWE6tHNmvvfArJTiDBZB++2GXp6gRj
         ZIfa8zzwS6XPvbdeQiwoAaZzZYJDa69j60CfbKcJYVmNLN9NJyJCNpPOEhaZ7d9x7H2x
         lLdyb0LDJ21TjNXFxRN6qSSt4r3yHGug9OEVoHdn0sZGh79oPL4yd4e3JuQhVuP7JF7B
         ynFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXuPhTgw6zqQNCNwQfJiop4H6Pmz3tu0p1FNKfPNsDfobnCHQbr6Wk5gZL4Ez0Tugq/O+JEwfGEiPX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2ioeSwf9vpjczcavSiBhhHA2FD4sFIhPqKqntnqZWsL4py5PK
	zTN3PZo2OQlzo6HJ6p8tH40RKbqb4gdrahmPXc8wYFosuRQYiBegoRA2oogWy0DPSAQz+IOe1v5
	yO2VVGBAPdzDKJ788L8nDja1iRGIUzSY=
X-Gm-Gg: AZuq6aKSsPShpqfLTw45FRQBDcZkEO4UXT6DLYAu+121VHKMUKrVRTK2vy7OXixtWm/
	S35t5myq5BcBVxDi0fI/n+IQKUuYwcYzY9RIJIw8cVM9c5Dq6UwgF6reSXSSgeyVhr4B+BzfM5B
	2ITyhb2JjzsU50mLq2RFCjH/uztpu3sOBgrDAfb/WOUCJmSLTHyFQTdB+yk7VYga0WoFtIt1OdR
	3Ydda4ZSowg5GbUtwMY2G27IBbgmXbnmQJFen6mVgMicitoN9Ep1XfGi9WsJXe8ZbBbcsOFUfZj
	jJ9PJCuaHgSXThL5X1cXKwODtuN2z6pYq2iGqQ==
X-Received: by 2002:a05:651c:198f:b0:383:5ea4:20b4 with SMTP id
 38308e7fff4ca-385a542374fmr18922711fa.13.1768990703314; Wed, 21 Jan 2026
 02:18:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com>
In-Reply-To: <20260120195407.1163051-1-hpa@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 21 Jan 2026 11:18:10 +0100
X-Gm-Features: AZwV_QiiG5af-Woi33axY2PiHu0ogLwqJDskpITdfLZMpipJdRjOPFZkqVB_8iM
Message-ID: <CAFULd4ZFwSmd4xanwm9f25AwaiSirpNEEeQgQNeyLO+Jokkf4Q@mail.gmail.com>
Subject: Re: [PATCH v1 00/14] x86 boot code cleanups, batch 1
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Petr Mladek <pmladek@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 8:54=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:

> This patchset also includes the removal of the gcc-specific version of
> the RELOC_HIDE() macro, by Uros Bizjak, as the other changes in this
> patchset makes that possible. Per Uros, this is holding back gcc
> development, so it seems pretty important.

Not that this issue is holding back GCC *development*, the historic
kludge unnecessarily suppresses optimizations that could be applied by
the compiler to produce better code.

Thanks,
Uros.
