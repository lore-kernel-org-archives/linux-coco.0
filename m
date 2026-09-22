Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572D63BBA1D
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 20:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108959; cv=pass; b=LNHwieCn+E/WE5I8Lr3N1PN1zpVosfiwUP0NTcb7HvjgwO5UF5Tckg2Qi+pkiF8VYDmruNv8HSKT0CYB0pjN4hVI51sPlwFF5TIdaK53zhn2E3zApNGQZe3r86zCcAcluXwWSeQyKxjAROM3v5JbEUBeOOhmtUL6xzP2/nfsuHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108959; c=relaxed/simple;
	bh=nl0WayBfnBzXB16tsQQ8C7lVQDuEYmE5cOfzxnYFlOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sAQ+Rr70RB7fPsuU9so2n41WZKdmUYsWecfhTY0Edr7jZ8tJDwDpscQtp1TR+hdGrzQuTgn3PtK9fFJJuiLaKCvAVCuFDsFuHtV+JwsyklskMxfRXUwLaoY2Fvp4RAIw0aC5ExO4Cg2DYF48nJ3CYG/0x3WMbmmSA2pD4bem2KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oZW5rsWb; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oZW5rsWb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a9d74e8292so703a12.1
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 13:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790108944; cv=none;
        d=google.com; s=arc-20260327;
        b=MOIglJAGxcEFscOlmJ5c/P70ZMi9NoElfB1zQvpjcgGI+U7+qktgV70UKxu2z/9kHh
         S+6jK6umIOeojc0BprU8KmGaXaIV5YD4cJqwCdryf8Dfge+P11nbS/+vb4Nh2d5KtrHU
         TZko3BqoQwrgxWETmfanx9Y23Cjehi1cFvyXxZZ8mjE6LDcmIkUs/s73VdHB84b+hrO8
         UTn2jJEaR9VdoV8qzuTmE8i9dMmmQCcWlqECpghTyrfzcDQPZ5n2PMAWcHoMjqv3H1+g
         6GMRYXzjyCw6c7gTIsk2FAOyaKkJ+52msdYhffQ2XAHwqet1f1KjCuAtQ3YpDw7ffZPB
         6Obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4auqSnGVaI9/viQvIpi/oQzDocBQYdGMjQ8F0EupbI=;
        fh=r0UbCsPl2fQ3efqTdCPdEXauczofDy88UhlwrNmvk8k=;
        b=aPTOzo9ipbqt1OAM4b/U8LIq7LLB8J095EQBc8yDlatcGLbBxM8AIS1PXDSn6w6tQC
         CRDFVH1Ai8pl6yp/F3penSXX4xcmMn08r/ncSpkUrB1Am0pIVDgP2y86Da3U5X7fxm0G
         SvJ3CQ/skXVesIT7ORrVk0UNaSGW3MIvYXP86u7tGCrbP2AOzpEpnZPssBQysx0+wxx5
         gIbT+aOZvvZJFOosOfLgB4oRtaOvvXQoeikzn4u58HW/as8fEEz449WTpoOGYJSTE2EZ
         yKoHVG95ZflX7rGTYsKUAUeGxZ1qNuAF/wkV4ovNByF1yR4aO97lQTmUIychHYb7QSJA
         r7RQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790108944; x=1790713744; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4auqSnGVaI9/viQvIpi/oQzDocBQYdGMjQ8F0EupbI=;
        b=oZW5rsWb15iiddT67faBkqaRgXjPe5NdULZQf8cp+fKIpMM4cOXc7gHDLw7G/AeP4d
         0vQKNvmyDemtisTfj0vMS6+qrYUHhuJB2MxmtWJ9aiDTdAyN0hIW2jAghbJeie3X3PXp
         d1bQshTH8fcLvVcbxVQLCVksOjuqMW8c7x22rFEaRtfs1vuLSBbeZCrSoo/dqA7y50lT
         N4Vh3zbT+XSwy5QG6pZT3FHQBReIxBdBTMUDO48ue89sexifH7pzEI8x3e4oolvYQTx0
         mZgJyUvlLYX9LszbvC4fjJ25jtKv6/Hrtw0/wKkpXLfHtb+J1LEjDMkfiVDbXNcHJm2r
         0fDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108944; x=1790713744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4auqSnGVaI9/viQvIpi/oQzDocBQYdGMjQ8F0EupbI=;
        b=Hi+I3kxF/jX54Ry28G90owhXP7Kwyz5rA40UH/nLIOSLaQbVwEjnxu+kBs/bRWkbwe
         FRJata1clp/Oem1RWbqdT8zH3oHTvhjq1oM/PcrJDemu4allHUAzwVtqXOYTg4IZyedu
         pQ6X6M8dkAj3wizPOlOVxLNFlnC9542/yots1enDya0afu5MGz+Rgy9tiAjF9fl/bPV0
         tJtGerks5KnRIFUQpo1gJlvk76tPt/0N4cE4AsIMOdw4sCHTQaP6eGuFLc5hx6O6Jm1Y
         /0eQgzxn6/dwXH3MZmcX1zeMy7BCrOsPDd/MIcFfB2A3DySQ9+pRBltglECHRrdz/GxR
         O95w==
X-Forwarded-Encrypted: i=1; AKwUvBw7LFHQxi5ABMFIRT4K8sQZ/ArVX5fzOb1KOOYeDytjijI4+zOAGNRfFXOo2MVQv5bGJQ9lLuYzdqOI@lists.linux.dev
X-Gm-Message-State: AFuF++kGoE9FzmMI8wA38uDjuuY31614z6emiYHKCB1/qDEUNYT/daVb
	brfFMmHBl4DkyI14jJ+0FTNDLhpqe/jaJve0d+8CggfAr3EJDRFN1gg6TmkUljj+ouTJ9AyqwJ1
	XmDUkhF2OSZb7eFkl2adnKvA6E8DNjvdk0dD2gVM=
X-Gm-Gg: AYBFou1zmLcHxDkmedmBiihzeFBB6fyI9blJuSOSNVwhzEuhEbFTj1O58IopC1WnxTn
	4rLCW47ldXReb7t2fJggsuOiVLW3SRh2GBG5YeTvAnNGQ2+Ii9cFbwqO9U1ISS9US7Qi0NeZuCq
	ohTXVPcdrolnNJQFqxVoKy0QTC6r9QRa69fPK/nJe8A2ihkqMhWfbP+Ly3YsDnlp3HzocWk5eLK
	UY+GMT6wgr3oBSHkYdVH4zceyJIGtoxJOiy5gCRbTOLaERlC+JUbRDD/HI/Kle5SsoE8S4QZw/C
	avarSHPAU4wLEZg923cTfaX7QJwA/86C3SoqnAQZVLnPJa/E8c6B2wDzU2jie1XqCNk8a2V9sHV
	EFfKKHxmv
X-Received: by 2002:a05:6402:683:b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6aab3b997d0mr10064a12.10.1790108943216; Tue, 22 Sep 2026
 13:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
 <0b2d8858-b361-4a64-986a-4c179210fbec@amd.com> <aqlWt4jb4CSPnecN@google.com>
 <d6179d34-a4b0-4548-8298-b790b333d22f@amd.com> <CAJxe5ctcVxmhRSw3Gt0POQTzRKoxXo7+Y3CPDe7cUZvC0QPK+g@mail.gmail.com>
 <aqrhFvwFJsQTaEkz@google.com> <CAJxe5csCb0DHZmJo9a-asXZ-tYdcyK1y0Y4Y9Uoixqn=sa8zRQ@mail.gmail.com>
 <arF9CXWC_UDYUMmf@google.com>
In-Reply-To: <arF9CXWC_UDYUMmf@google.com>
From: Jacky Li <jackyli@google.com>
Date: Tue, 22 Sep 2026 13:28:51 -0700
X-Gm-Features: AclHuK_mY43f-bAoEDGwDRGxsfpJ91_apKdGyjoPSuWVw4gI8ssd82nL_grfFCw
Message-ID: <CAJxe5csuNRcULSTeRRAq0GGQASTTpgwqOCXwNZJtApeZb_Va3A@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
To: Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:53=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> No, kvm_vcpu_map() actually has far worse semantics.  GUP pins the *page*=
, it does
> not pin the userspace mapping.  I.e. kvm_vcpu_map() guarantees that KVM w=
on't write
> to a freed page, but that's literally it.  E.g. if userspace mprotect()'s=
 the page
> to make it read-only, KVM will write to what is supposed to be a RO page.=
  Or if
> userspace completely unmaps the page, KVM will write to soon-to-be-freed =
memory.

Sorry for the confusion. I didn't mean writing to the response page through
map.hva; I only meant calling kvm_vcpu_map() to validate and pin the page,
while still using kvm_write_guest() to copy the response back:

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4231,19 +4231,25 @@ static int snp_handle_guest_req(struct
vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
  if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE))
  return -EIO;

+ CLASS(kvm_vcpu_map_local, map)(&svm->vcpu, gpa_to_gfn(resp_gpa));
+ if (map.ret) {
+ svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_INPUT);
+ return 1;
+ }
+
  data.gctx_paddr =3D __psp_pa(sev->snp_context);
  data.req_paddr =3D __psp_pa(sev->guest_req_buf);
  data.res_paddr =3D __psp_pa(sev->guest_resp_buf);

  /*
  * Firmware failures are propagated on to guest, but any other failure
  * condition along the way should be reported to userspace. E.g. if
  * the PSP is dead and commands are timing out.
  */
  ret =3D sev_issue_cmd(kvm, SEV_CMD_SNP_GUEST_REQUEST, &data, &fw_err);
  if (ret && !fw_err)
  return ret;

  if (kvm_write_guest(kvm, resp_gpa, sev->guest_resp_buf, PAGE_SIZE))
  return -EIO;

Because the actual payload write still goes through kvm_write_guest()
(uaccess) rather than map.hva, a concurrent mprotect(PROT_READ) or
munmap() would still cause kvm_write_guest() to fail rather than
overwriting a read-only page or soon-to-be-freed memory.

> Who cares?  The guest can only hurt itself by converting resp_gpa to priv=
ate.

The only reason we care from the hypervisor's perspective is that
a post-command -EIO/-EFAULT exit causes the VMM to abort and looks like
a hypervisor infrastructure failure rather than a guest error.

That said, this only matters if a malicious guest deliberately races a
conversion against its own request. Given the complexity of a gpc and
that kvm_vcpu_map() is being phased out, the 1-byte tickle write is much
simpler and good enough to protect normal guests from burning their
VMPCK or killing the VM over a bad resp_gpa.

I'll send a v2 with the tickle approach. Thanks!
