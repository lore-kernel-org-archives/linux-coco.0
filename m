Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AE437DEBB
	for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810960; cv=none; b=U0HRTqKoCisIfBghKrmzkCGP7WRp4DDeJU+TGCuU07lFcBm/FKFyBmb8mSUXBiO63wthfmH2NYRccORMzWY/yaVFT3mnSpHIVdX+/lP3nVcv6o4jt3sZWY5nkGrYxIrvIWtMZNuCBs0lknRmQCn5TyX19/pwLvf/1LKikFW1bDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810960; c=relaxed/simple;
	bh=xPyYERiI4Q6AfUdAOldljcoGfq2AnvPTXQYmen3edCk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=elkbiPsyiF0uABCp0La1b6rMCzggU3jvXjCBOGi5zpM3NMk9xvZaa9Vk0CEl+NoHz6VjS9MlUZhAttGH5NuhU41AFNtdR7RBBsOm4ZA97+W+kzbs4bNIkC6z1qhbCXiLEr3YGYL3ta7a1KpPEM8K4/GsraSSs0qI36hzwyn7SIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gnOshCTh; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gnOshCTh"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so1468320a91.2
        for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791810959; x=1792415759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gHHQ3heGxmvzhSaG+FW3OED46/i9POKwWnKdCTyUaS8=;
        b=gnOshCThhW9q20pG7/hmy6udXt39l2+JgKJWhNe4MpB+52HPZD+WuWphTm/A+r2v/o
         Jt6HpqZQwiMARHcrjTv4Kh0TVV1nDHKo1erUVHXPlvdKGja1QU9tYkqQIUMyiMaJ8Ydy
         2bx+9oQ659f7G0MQI0UtE7GazKzGRjPpApXDGDHYRnoR5XAMqVVa+tN/ZZJwvVgwJQQD
         nShqemnby6gwYimD0QPI/p7LIqsfv8SuxE4tywIQJZ93H2n1U6P2dzJM4PWu3DIap7EA
         o8sXJcG9Thcrgxhsl/p2JKhPjA34D03ju0wi5EQhQXuKT7tuFCzhK3SIbzYIw1Gj+LKp
         G0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810959; x=1792415759;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHHQ3heGxmvzhSaG+FW3OED46/i9POKwWnKdCTyUaS8=;
        b=hz8UvqXTU+Trd3orXRzWhkuJ+UVMN66/yRRkNOXMkzbJMiLK9s19YlMVH/BL3vBOju
         wnhLmZSNbGocBl5T12ulZd6+Ry0GyREn41Y0L2TRLDBqOyQT5kN0JFX/1NxePMjVm1Al
         ShvUTHnQ6kbbJ65uEx3S725PM8BAko0pKkV/UQjRwqQ1D/2OI0MKdkzYTQyh7tqad9wR
         c5eEXT/akKBmIkLz8ntKX4VwoUk6fT3gmGEHFP+9dueu+UTUid0ct2+k8u3fXglfXmER
         8f3aMQUm8LAK/hlOK/RHPdEQqsfSas+zrnQM4RYN9jWKpPoet9ZkPSaEUotNP/mLFl9e
         HEtA==
X-Forwarded-Encrypted: i=1; AKwUvBzScTdnGFNpMgIuSqqGSHpBfxZIHG0BdHT2+WHSMMC1sFOAEIakJHEfNFoj7MyQ1Si+EB5+f7rHUbsr@lists.linux.dev
X-Gm-Message-State: AFq9FYK7xHB7ixywMIko5BG6tzcV26CDIQ70XXcOkkO5GJaYAkWPCO9n
	M3gDKSh6xYlY2YuFRbg5ZI8+61u/uIw6nfSI3xzyRAFALJeW8KUn29uJUomXYlI2u8FdImmsHuB
	deTUlYQ==
X-Received: from pjbbl14.prod.google.com ([2002:a17:90b:98e:b0:3a6:7ee4:e327])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5444:b0:3aa:fc22:8aa7
 with SMTP id 98e67ed59e1d1-3ab3ac72e81mr7467432a91.53.1791810958601; Mon, 12
 Oct 2026 06:15:58 -0700 (PDT)
Date: Mon, 12 Oct 2026 06:15:57 -0700
In-Reply-To: <asmjItCkW74Z6AV1@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930001127.3170009-1-seanjc@google.com> <3c0ee89f560b0235f293b32019327186785aa795.camel@intel.com>
 <arxd78Pn6WWL6TGq@google.com> <asdOF41hqDpycXKU@yzhao56-desk.sh.intel.com>
 <aslVXBSovWuAsNtN@google.com> <asmjItCkW74Z6AV1@yzhao56-desk.sh.intel.com>
Message-ID: <aszdjZCNWdIiXniC@google.com>
Subject: Re: [PATCH v2 0/3] KVM: TDX: Syntehsize SHUTDOWN on unhandled EPT Violation
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kas@kernel.org" <kas@kernel.org>, "jthoughton@google.com" <jthoughton@google.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"sashiko-bot@kernel.org" <sashiko-bot@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026, Yan Zhao wrote:
> On Fri, Oct 09, 2026 at 01:58:04PM -0700, Sean Christopherson wrote:
> > On Thu, Oct 08, 2026, Yan Zhao wrote:
> > > On Tue, Sep 29, 2026 at 05:55:11PM -0700, Sean Christopherson wrote:
> > > > On Wed, Sep 30, 2026, Rick P Edgecombe wrote:
> > > > > On Tue, 2026-09-29 at 17:11 -0700, Sean Christopherson wrote:
> > > > > > Signal SHUTDOWN instead of -EIO if the guest accesses an unacce=
pted page and
> > > > > > has disabled EPT Violation #VEs on such accesses.=C2=A0 Returni=
ng -EIO is all but
> > > > > > guaranteed to mislead the VMM into thinking KVM (or the VMM) me=
ssed up, and
> > > > > > will likely result in the VM being terminated instead of reboot=
ed.
> > > Hmm, it's by design in my previous implementation to terminate a VM w=
hen the
> > > guest accesses an unaccepted page and has disabled EPT Violation #VEs=
 on such
> > > accesses, according to the TDX module spec:
> > >=20
> > > "This happens if the TD is configured to TD-exit (instead of a #VE) o=
n an EPT
> > >  violation due to accessing a PENDING page. It normally indicates an =
error
> > >  condition; the host VMM may decide to tear the TD down."
> > >=20
> > > So, for the initial implementation, we chose to invoke kvm_vm_dead() =
and print
> > > out the exact reason as a hint to the system admin.
> >=20
> > kvm_vm_dead() should only be used when KVM *needs* to prevent userspace=
 from
> > running the VM.
> Ok. But my previous intention was to kill the VM regardless of whether th=
e
> userspace handles KVM_EXIT_SHUTDOWN or not.
> Did I use it correctly?

No.  Returning -EIO kills not only what KVM sees as the VM, it often kills =
what
the end user, i.e. the customer in our case, see as the VM.

> I'm asking because you added the Fixes tag and "Cc: stable@vger.kernel.or=
g" for
> patches 1/2 as well.
>=20
> > > (Previously, reboot was also not supported for a TDX guest).
> >=20
> > But QEMU isn't KVM.  While QEMU is the de facto reference VMM, it's imp=
ortant to
> > keep in mind that it's not the only VMM (and that's not just about Goog=
le's VMM,
> > there are plenty of other non-QEMU VMMs that are used in production env=
ironments).
> Hmm. That was the reason for me to choose forcefully killing the VM insid=
e KVM,
> since for the initial implementation, I didn't want to bother updating ev=
ery
> VMM :)

Why would any VMM need to be updated?  VMMs already need to handle KVM_EXIT=
_SHUTDOWN
for TDX VMs.
