Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C65D37E2FC
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 03:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011377; cv=none; b=rPLD1VInZw7Wl57HUBMzshupebChTg+KUeO4LecQYqMsIV6KsILppCfI/ZZJ/T+bd30MzMLuggUhBMY8cp0jGlcZeV5iXdy/8UWybZtE92ASXjzdnEJsn5o2E+UkyhFG2cgrbZVxWJXu9yRk8DqoKUcwHuauF0OATiysCG4s2RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011377; c=relaxed/simple;
	bh=7dJYZIzG3Oi0vO9RaTy06gwPmtBYzFkra05nhb44Z2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrVXYqmmXWjR0HLgurEsCzQAiScnEDy2C8n3A1kg7TopOL/Us5xpn3DpI47FW8E3vCyvpaVM6nSThOQoCLmKRC+IAxluOf3DkDT4N8NMCsX2fg0vdQVkEGkQnw0DjYJUtXaV7TeYS8Q5aMMpjtDGsbIq7+I78u8OlFs1WKZjugA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=EvyJcIhB reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="EvyJcIhB"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 67AED40E00B9;
	Thu, 10 Sep 2026 03:36:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dRY_Vk06yFGE; Thu, 10 Sep 2026 03:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789011360; bh=9yTC/8K7DkEW7wNBiOeYCl6vp4+4UfmoiV8qnzg+trY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EvyJcIhBDYhrN+NM2dP8a9+I4mlIS36ehHtOmAqNUQpY1Gi4KGadWSEI/y6wQMu3t
	 +zVQqGDrvgfvxSkLA+6WQQ/VQniS1xPJXzJPh97YeFTnEjF6+n1Yxjmjud6Lin/LcA
	 MaHQLURA7AM0rm5ym0P1ulWCihZM7WzFciJj/EF1uovU0Oa7oxEV9NeEkWLaKuW1qV
	 fT+kFSVcdKrse8y+ov51TujwLO+TSwMMk7HXthpKrKkX0Obc2Yl6gTBIUQCt72JSi+
	 EohPhVgfI8oiz2My2mT1biOV43ihYImt3gE0jb94PtD32Qbiu8kYNnBUGrLBCdx4s2
	 ngodQlmdt3EPHtx9kKIhwu5h1rZdI099Uztq9zRw6x0CwOAD+71OlGg5A9QveMRl2b
	 m2U8fcGdxEM/RMoLsRvWVl4cmebTN1aD9duJQ35Ha3p359+P1HWcupwGNrUyoICpft
	 kYFMcuBhP00KGOYVY5hmsq67EPalSj1XitggJaH57UvVHV9s7o5n4l0wgiuJXBflyp
	 wTknCTIjmr9+GC8KqGbjJClfMjsYL15pXXlzVDNWK7qZfp4JN/v1aps9vsAtSVODwN
	 q48Lm63iWWTBUOe7Lef+ELeamUufE3SxHJlaggQFr5OOayBkDUDBqMZS/kP0+zsWP3
	 ldwkenbXwLvhoqWgkZfNzCfA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9C7B840E00E8;
	Thu, 10 Sep 2026 03:35:49 +0000 (UTC)
Date: Wed, 9 Sep 2026 20:35:46 -0700
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	hpa@zytor.com, Tom Lendacky <thomas.lendacky@amd.com>,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: [PATCH 1/3] x86/coco: Add CC_ATTR_GUEST_SEV
Message-ID: <20260910033546.GAaqIlkhwE9V2vbz-l@fat_crate.local>
References: <20260803125827.718024-1-joro@8bytes.org>
 <20260803125827.718024-2-joro@8bytes.org>
 <20260910024027.GEaqIYmy___31vI-iZ@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910024027.GEaqIYmy___31vI-iZ@fat_crate.local>
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 07:40:27PM -0700, Borislav Petkov wrote:
> On Mon, Aug 03, 2026 at 02:58:25PM +0200, J=C3=B6rg R=C3=B6del wrote:
> > From: Joerg Roedel <joerg.roedel@amd.com>
> >=20
> > Add a new attribute to the CC platform code to check whether the
> > kernel runs in an environment using SEV memory encryption. This will
> > be used to establish the an sev/ directory in SYSFS (which is
> > currently SEV-SNP-only).
>=20
> Yeah, the initial intention for cc_plaform_has() is to use it in arch-a=
gnostic
> code and for something which you're going to use in coco code itself, y=
ou're
> better off simply doing:
>=20
> 	if (sev_status & MSR_AMD64_SEV_ENABLED)
>=20
> I can fix that up when applying if you prefer - it is easy enough.

IOW, I merged them all three into this simple one.

Author: Joerg Roedel <joerg.roedel@amd.com>
Date:   Mon Aug 3 14:58:25 2026 +0200

    x86/sev: Report MSR_AMD64_SEV in sysfs
   =20
    Add SEV_STATUS to the cpu/sev/ sysfs hierarchy and report it for all =
SEV
    guest types.
   =20
      [ bp: Merge into a single patch, simplify. ]
   =20
    Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
    Link: https://patch.msgid.link/20260803125827.718024-2-joro@8bytes.or=
g

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documen=
tation/ABI/testing/sysfs-devices-system-cpu
index 82d10d556cc8..cec413a71491 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -690,15 +690,20 @@ Description:	Umwait control
=20
 What:		/sys/devices/system/cpu/sev
 		/sys/devices/system/cpu/sev/vmpl
+		/sys/devices/system/cpu/sev/sev_status
 Date:		May 2024
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:	Secure Encrypted Virtualization (SEV) information
=20
-		This directory is only present when running as an SEV-SNP guest.
+		This directory is only present when running as an SEV guest.
=20
 		vmpl: Reports the Virtual Machine Privilege Level (VMPL) at which
-		      the SEV-SNP guest is running.
+		      the SEV-SNP guest is running. This file is only present
+		      when running as an SEV-SNP guest.
=20
+		sev_status: Reports the value of the SEV_STATUS MSR which
+			    enumerates the enabled features of an SEV
+			    environment.
=20
 What:		/sys/devices/system/cpu/svm
 Date:		August 2019
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index ec8fc02bd636..4751bfbe694f 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1431,15 +1431,22 @@ static ssize_t vmpl_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%d\n", snp_vmpl);
 }
=20
+static ssize_t sev_status_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0x%llx\n", sev_status);
+}
+
 static struct kobj_attribute vmpl_attr =3D __ATTR_RO(vmpl);
+static struct kobj_attribute sev_status_attr =3D __ATTR_RO(sev_status);
=20
-static struct attribute *vmpl_attrs[] =3D {
-	&vmpl_attr.attr,
+static struct attribute *sev_status_attrs[] =3D {
+	&sev_status_attr.attr,
 	NULL
 };
=20
 static struct attribute_group sev_attr_group =3D {
-	.attrs =3D vmpl_attrs,
+	.attrs =3D sev_status_attrs,
 };
=20
 static int __init sev_sysfs_init(void)
@@ -1448,7 +1455,7 @@ static int __init sev_sysfs_init(void)
 	struct device *dev_root;
 	int ret;
=20
-	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+	if (!(sev_status & MSR_AMD64_SEV_ENABLED))
 		return -ENODEV;
=20
 	dev_root =3D bus_get_dev_root(&cpu_subsys);
@@ -1463,7 +1470,20 @@ static int __init sev_sysfs_init(void)
=20
 	ret =3D sysfs_create_group(sev_kobj, &sev_attr_group);
 	if (ret)
-		kobject_put(sev_kobj);
+		goto drop_kobj;
+
+	if (sev_status & MSR_AMD64_SEV_SNP_ENABLED) {
+		ret =3D sysfs_add_file_to_group(sev_kobj, &vmpl_attr.attr, NULL);
+		if (ret)
+			goto drop_sysfs;
+	}
+
+	return 0;
+
+drop_sysfs:
+	sysfs_remove_group(sev_kobj, &sev_attr_group);
+drop_kobj:
+	kobject_put(sev_kobj);
=20
 	return ret;
 }

>=20
> --=20
> Regards/Gruss,
>     Boris.
>=20
> https://people.kernel.org/tglx/notes-about-netiquette

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
