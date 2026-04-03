Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4851A3C4559
	for <linux-coco@lists.linux.dev>; Fri,  3 Apr 2026 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775243277; cv=none; b=vEv8CaagZev/1NDA4Q/QDcriWu3CkjnfU/yXsxJm+5NCfNVvFvsuxoRIU4F3Qjv5Bbfx473RWSYFM/gqhLdeVrbKTz9XHuhONeXv3WxLuB7OfUwr02HFu8lDS194FUCs91SYSL5btTpcDEPI20EAKAHRutEdyACS9b5+gyf7bcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775243277; c=relaxed/simple;
	bh=1QsnQMON75YL7mEZvMtcGUpdWC8k2PnitFmIYIXQ4ao=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aHIAI1p7siVk+1xLPvdz0Ysj5JwBxaaXP9stQoe9Ak5O1HToJ9MC2ZUnVP8OQ5jae9KBu2MmRMRFs587uefSyqCpH/g6agrfEgLeGD15U0Olcphlwf9RwTso3yKSUVf7UjaPdQYiMtc3SFDKqGxXgMZHQ/a4MOf8LJIRgzVnL1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ux1XKSsj; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ux1XKSsj"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b2454fc131so37137105ad.3
        for <linux-coco@lists.linux.dev>; Fri, 03 Apr 2026 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775243276; x=1775848076; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgGRLe2N4RNPZGrafaVch3yXQwPK/GvM0Nk9j2ZEGBQ=;
        b=Ux1XKSsjuQ8vTWLbs884vstk/BLXCgWWcX+dy4gC9OI7UuBX9/f0+rdayueAhRCqbj
         80YuJ68/HRjXhqsLfP9rZ0WjMxhu3Y7BdeTKK1qbNSezuoBYJrxHd9Vh1Sorb21/3Hgo
         j8oSTyzENd1Vao2MN9eHBOeME0iY7u2aY8BTcEV3ppEmfbNEmLnB+sNBfo1oBGKGrvQ7
         1D2pNTya/GMLqtcBOYyvsnRWcqJ8a5c2ofnERXJfyqjOGiT8cbR7PyNIQ0nKHANZlzP0
         /ivcMheSMZpVg4BqStJa7TR6IPRoxEMUYbh5fLLgJxiNVDhG1pcj9Jf4MnkesU7XsK3l
         Ss+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775243276; x=1775848076;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HgGRLe2N4RNPZGrafaVch3yXQwPK/GvM0Nk9j2ZEGBQ=;
        b=lgBfv3rEbFzl7VeAt960yADdXm4OS3OQCcZgkoCiHnzNkOJ+HJl3Ce+EWyjWVtRvA8
         d2cKb/ZSyCZgpOXzEa8zpm+e4juT7wozQ+5k+0yGpgtdsT+Iy8HAfrTQhwAIbkpDJK1N
         O2WTg3AqgzhU620HTgri9R9Z1SqMW7R9gyPhxIWpqcmNe8TuY75C+7tolneaNlHr3QDJ
         tkHFp6MZebLgRzlqsl1bptb9rW+mQnsiGPt9xqQ90cBgcI6Gz3VzCpfI8r8396OEmWw5
         nWEUnym7XCL+oetDARGhmaywHKMAWerABeWdQSPNt00UlWxShNT7/5g3QJuGySWetVeI
         0fUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdkp9rfGZnbSM0i2/5Ir2ncMGNVOxfB7zTRJ2AEJXCVyx6jK0a80eFHos269+329SyjUiIf/uiCrTE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9YaS7fJsHCIUt7CfzTUnJt/XsX/fp60XgcaRTlYWyMhMk8Y8w
	uMKiqQECTfuaMk6cglMvpDMrTQ6cF6/TA8C2kArw9DNH6owsWvGfFPEllehhPu/SpT7cz0rkAqc
	IS01uZg==
X-Received: from plnw11.prod.google.com ([2002:a17:902:da4b:b0:2b0:4958:718])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:388e:b0:2b2:6df1:1112
 with SMTP id d9443c01a7336-2b281969a70mr39621565ad.40.1775243275489; Fri, 03
 Apr 2026 12:07:55 -0700 (PDT)
Date: Fri, 3 Apr 2026 12:07:53 -0700
In-Reply-To: <401db97a254b356ad8539a5d637d68ee826179a5.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260318190111.1041924-1-dmaluka@chromium.org>
 <94b06319-2be8-4f01-87d1-8989ae1ca85d@intel.com> <cb99e44c-8bc9-4bab-b485-9f63a4d0b262@linux.intel.com>
 <93358559-5ed1-4574-8951-24d7ea9354e4@intel.com> <ee8d7ea3-0ece-43cf-ab07-6954df4c01ad@linux.intel.com>
 <f67179d7050ae28ac261bb6227b1c045c10579c9.camel@intel.com>
 <ac_rNT69TdocrMYc@google.com> <401db97a254b356ad8539a5d637d68ee826179a5.camel@intel.com>
Message-ID: <adAQCXI-7Yj0wcKA@google.com>
Subject: Re: [PATCH] KVM: TDX: Fix APIC MSR ranges in tdx_has_emulated_msr()
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "tglx@kernel.org" <tglx@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "dmaluka@chromium.org" <dmaluka@chromium.org>, 
	"x86@kernel.org" <x86@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"bp@alien8.de" <bp@alien8.de>, "kas@kernel.org" <kas@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026, Rick P Edgecombe wrote:
> On Fri, 2026-04-03 at 09:30 -0700, Sean Christopherson wrote:
> > > > It comes down to a tradeoff. Should we prioritize code simplicity b=
y dropping the function,
> > > > or keep it to explicitly catch this misbehaving guest corner case?
> > >=20
> > > I think from KVM's perspective it doesn't want to help the guest beha=
ve
> > > correctly.
> >=20
> > Uh, yes KVM does does.  KVM is responsible for emulating the APIC timer=
, isn't it?
>=20
> Yea totally. We need to emulate the interface accurately. But we are kind=
 of
> making up the contract after the fact. If the guest performs the wrong ty=
pe of
> MSR write, should we make the contract that the VMM should help it catch =
it's
> mistake?
>=20
> >=20
> > > So we can ignore that I think. But it does really care to not define
> > > any specific guest ABI that it has to maintain. So tdx_has_emulated_m=
sr() has
> > > some value there.=C2=A0And even more, it wants to not allow the guest=
 to hurt the
> > > host.
> > >=20
> > > On the latter point, another problem with deleting tdx_has_emulated_m=
sr() is the
> > > current code path skips the checks done in the other MSR paths. So we=
 would need
> > > to call some appropriate higher up MSR helper to protect the host? An=
d that
> > > wades into the CPUID bit consistency issues.
> > >=20
> > > So maybe... could we do a more limited version of the deletion where =
we allow
> > > all the APIC MSRs through? We'd have to check that it won't cause pro=
blems.
> >=20
> > What?  No.  KVM can't get actually read/write most (all?) MSRs, allowin=
g access
> > is far worse than returning an error, as for all intents and purposes K=
VM will
> > silently drop writes, and return garbage on reads.
> >=20
> > > Failing that, we should maybe just explicitly list the ones TDX suppo=
rts rather
> > > than the current way we define the APIC ones. As you mention below, i=
t's not
> > > correct in other ways too so it could be more robust.
> >=20
> > No?  Don't we just want to allow access to MSRs that aren't accelerated=
?  What
> > the TDX-Module supports is largely irrelevant, I think.
>=20
> Not sure if I might be missing the point here. As above, we don't have en=
ough
> info to=C2=A0know which MSRs are accelerated. If the guest enabled #VE re=
duction, it
> changes which ones are accelerated and the VMM is not notified.

What does the "accleration" in that case?  Or does it reduce which ones are
accelerated?

> I think the below is a sane limitation, but doesn't lets KVM perfectly no=
tify
> the guest when it screws up.
>=20
> So the line would be to block MSRs that can never be emulated.
>=20
> BTW, I've been treating this secret contract change as an arch mistake to=
 at
> least not build on. It's a whole subject though... Let me know if you are
> interested in the details.
