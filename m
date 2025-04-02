Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636578F58
	for <linux-coco@lists.linux.dev>; Wed,  2 Apr 2025 04:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743567254; cv=none; b=ZsBCn5v+erynS6ZVD2vk+F3XXVYhcW4LmKzaDwUI2pLpzUqSAxrejPa/A++DIId/a7u6SDrjEPs7wembrO3aE5YjeIguiVNXv5kDNLQ/aexk66SqirV57re71O+TbRZmwRPFRRGZDnxxWjggjuVBTt/Wix33ZfyJr0d9CDDVPeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743567254; c=relaxed/simple;
	bh=rvx+GuLWwGwbsV2wJ2BPRYWONGuF5PSQA45HKNF8faU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxqfJSy0ygYfVdQdHeqQXD/PwxRzPAQnyy65NwiXasxRIp1ZQ2ZQUiZ0cJAq56QyErNrT4/5JvxKRyFILF/N3f7BB2DY175bt7KYrffgQvtGJby0h9PZ5TdHki5AaXzMAqsyGGZG/q4Q0DzyxuitOco7ShHLwWEh/EgzyGHXDRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qXrkh10f; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qXrkh10f"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so10094170a12.1
        for <linux-coco@lists.linux.dev>; Tue, 01 Apr 2025 21:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743567251; x=1744172051; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4qbnKVSROxJYiBw5xKsO37DBTEhQjTBkKNLkLh85IY=;
        b=qXrkh10fWw18utfCwZn5Jvh77Bd9uYwsJ0QMreZOEweabIxrJcgd8VhOHrk7jcWZij
         SoDLUptIIG1IkW+ka6nBWpqW7Hl4q+RvsqZca2k3z18cJ/Hdw6vFGaJ2NZYkiwWs7WR1
         BtIzhMmdBLG602D0yIU0++6+eBewx5Qch5p/BcaWxJL/Au+JT4a2mbr9NgZ6/4Sz5rFT
         qRfWM0VLeuYlQZ0rfZKatm7a2QzbU+jOIgVb2vSCMePAxVibO5co80tkxpGL0QGAeVsm
         6weDMIfUXiyqsPMqqtOZYoGYWJ0I3+bx4IpVr0GOZAzqBGyGPHnl7xxRQ9RtbxpkX9a+
         c5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743567251; x=1744172051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4qbnKVSROxJYiBw5xKsO37DBTEhQjTBkKNLkLh85IY=;
        b=MKWK2jpJ3+cNFeeuYxrvInhFWSiRv9tk4O69UrjhBYRnHh+wOrRQbiUDJxULBc8EZi
         Wn2jEefk62ZYR2zdF2YCk8Lj/7HIHV6e+PtzsWl7EHK6v08kOjPQw+xti4T1M8sJbmbK
         qG92D/JdfdhqAHK+1Bm64Thy//Sv9GBbXWHkRKkHm6dn8+nwuivTvRDm5DKNu45uYxL1
         Xovnxu6dxgGUoV1GAGcRpxAcKleYTVMINgdzoLvSiIWjaxZQ0jYPhghGYofk8kcancMR
         isTbQM3SfAfXndNLeepVdrjtJVPEe2ohvBDbrJ33R8hmh19pqndmaoqydsYBOomVHY0F
         3N7g==
X-Forwarded-Encrypted: i=1; AJvYcCW833STTqqyL5/PjmJWlnIdkRJTJHtMcsoti3UpO/BgfPYB/x/g0wPRFcLs14amTk2dV8QAvEq7tVXX@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9lizFyYDoGQzaxKCQFBkfK/n3nklkP5enTqU1xUrPCYOZ+fRh
	12L6+2LCzFUFKxMh5fTf0aVC3MIHGQ3HJFc9vb0TgkA0ybAbKmKMqYKNvpqwhJwKvLa1xb8pf1f
	uBGJieTThVDnjT/kx+g/MfKYnaLVFRyCoBofe
X-Gm-Gg: ASbGncuR0JDdKhlhoKgoMfUruhBrWy5byugdRrl8VAFLxpwnggFvpfF6gwwd46nDQoi
	O9kuvFF2sXul1FCvMy3+m/4PK1ZqRXB6uU9PVf1kEnZWarg7GIlRI2cNhx3/qGZvgnhVAd7f+46
	2HV5v2K/Kbjm/TT6lC3RM/a4KDdw==
X-Google-Smtp-Source: AGHT+IF1gXQkIuJNcdromPnCBu8AoB+fz9DPg+iOjqB/NF28q58zKdLFxdOVtYNijxbGofbAvQUwWw6/MojaoiaVpkk=
X-Received: by 2002:a17:907:98a:b0:ac6:b811:e65b with SMTP id
 a640c23a62f3a-ac738b4aeb5mr1214686166b.36.1743567250615; Tue, 01 Apr 2025
 21:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250331103900.92701-1-sgarzare@redhat.com> <20250331103900.92701-2-sgarzare@redhat.com>
In-Reply-To: <20250331103900.92701-2-sgarzare@redhat.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 1 Apr 2025 21:13:58 -0700
X-Gm-Features: AQ5f1JqVPeJtdXs3EUp3Rwq_HnexaQQM-jWQhSzqJ5IDqEUT-IhWLPYlLSRYj7A
Message-ID: <CAAH4kHYWT_LhxciFgEpG4wTRstZsY3grjrL0zjbERzrPyQZ9rw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] x86/sev: add SVSM vTPM probe/send_command functions
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, linux-coco@lists.linux.dev, 
	Dov Murik <dovmurik@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <jroedel@suse.de>, x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 3:39=E2=80=AFAM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> From: Stefano Garzarella <sgarzare@redhat.com>
>
> Add two new functions to probe and send commands to the SVSM vTPM.
> They leverage the two calls defined by the AMD SVSM specification [1]
> for the vTPM protocol: SVSM_VTPM_QUERY and SVSM_VTPM_CMD.
>
> Expose these functions to be used by other modules such as a tpm
> driver.
>
> [1] "Secure VM Service Module for SEV-SNP Guests"
>     Publication # 58019 Revision: 1.00
>
> Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v5:
> - added stubs when !CONFIG_AMD_MEM_ENCRYPT [Dionna]
> - added Jarkko's R-b
> v4:
> - added Tom's R-b
> - added functions documentation [Jarkko]
> - simplified TPM_SEND_COMMAND check [Tom/Jarkko]
> v3:
> - removed link to the spec because those URLs are unstable [Borislav]
> - squashed "x86/sev: add SVSM call macros for the vTPM protocol" patch
>   in this one [Borislav]
> - slimmed down snp_svsm_vtpm_probe() [Borislav]
> - removed features check and any print related [Tom]
> ---
>  arch/x86/include/asm/sev.h |  9 ++++++
>  arch/x86/coco/sev/core.c   | 59 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
>
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index ba7999f66abe..ba7a0a327afb 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -384,6 +384,10 @@ struct svsm_call {
>  #define SVSM_ATTEST_SERVICES           0
>  #define SVSM_ATTEST_SINGLE_SERVICE     1
>
> +#define SVSM_VTPM_CALL(x)              ((2ULL << 32) | (x))
> +#define SVSM_VTPM_QUERY                        0
> +#define SVSM_VTPM_CMD                  1
> +
>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>
>  extern u8 snp_vmpl;
> @@ -481,6 +485,9 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
>  int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_=
req *req,
>                            struct snp_guest_request_ioctl *rio);
>
> +bool snp_svsm_vtpm_probe(void);
> +int snp_svsm_vtpm_send_command(u8 *buffer);
> +
>  void __init snp_secure_tsc_prepare(void);
>  void __init snp_secure_tsc_init(void);
>
> @@ -524,6 +531,8 @@ static inline struct snp_msg_desc *snp_msg_alloc(void=
) { return NULL; }
>  static inline void snp_msg_free(struct snp_msg_desc *mdesc) { }
>  static inline int snp_send_guest_request(struct snp_msg_desc *mdesc, str=
uct snp_guest_req *req,
>                                          struct snp_guest_request_ioctl *=
rio) { return -ENODEV; }
> +static inline bool snp_svsm_vtpm_probe(void) { return false; }
> +static inline int snp_svsm_vtpm_send_command(u8 *buffer) { return -ENODE=
V; }
>  static inline void __init snp_secure_tsc_prepare(void) { }
>  static inline void __init snp_secure_tsc_init(void) { }
>
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index b0c1a7a57497..efb43c9d3d30 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -2625,6 +2625,65 @@ static int snp_issue_guest_request(struct snp_gues=
t_req *req, struct snp_req_dat
>         return ret;
>  }
>
> +/**
> + * snp_svsm_vtpm_probe() - Probe if SVSM provides a vTPM device
> + *
> + * This function checks that there is SVSM and that it supports at least
> + * TPM_SEND_COMMAND which is the only request we use so far.
> + *
> + * Return: true if the platform provides a vTPM SVSM device, false other=
wise.
> + */
> +bool snp_svsm_vtpm_probe(void)
> +{
> +       struct svsm_call call =3D {};
> +
> +       /* The vTPM device is available only if a SVSM is present */
> +       if (!snp_vmpl)
> +               return false;
> +
> +       call.caa =3D svsm_get_caa();
> +       call.rax =3D SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
> +
> +       if (svsm_perform_call_protocol(&call))
> +               return false;
> +
> +       /* Check platform commands contains TPM_SEND_COMMAND - platform c=
ommand 8 */
> +       return call.rcx_out & BIT_ULL(8);
> +}
> +EXPORT_SYMBOL_GPL(snp_svsm_vtpm_probe);
> +
> +/**
> + * snp_svsm_vtpm_send_command() - execute a vTPM operation on SVSM
> + * @buffer: A buffer used to both send the command and receive the respo=
nse.
> + *
> + * This function executes a SVSM_VTPM_CMD call as defined by
> + * "Secure VM Service Module for SEV-SNP Guests" Publication # 58019 Rev=
ision: 1.00
> + *
> + * All command request/response buffers have a common structure as speci=
fied by
> + * the following table:
> + *     Byte      Size       In/Out    Description
> + *     Offset    (Bytes)
> + *     0x000     4          In        Platform command
> + *                          Out       Platform command response size
> + *
> + * Each command can build upon this common request/response structure to=
 create
> + * a structure specific to the command.
> + * See include/linux/tpm_svsm.h for more details.
> + *
> + * Return: 0 on success, -errno on failure
> + */
> +int snp_svsm_vtpm_send_command(u8 *buffer)
> +{
> +       struct svsm_call call =3D {};
> +
> +       call.caa =3D svsm_get_caa();
> +       call.rax =3D SVSM_VTPM_CALL(SVSM_VTPM_CMD);
> +       call.rcx =3D __pa(buffer);
> +
> +       return svsm_perform_call_protocol(&call);
> +}
> +EXPORT_SYMBOL_GPL(snp_svsm_vtpm_send_command);
> +

How do we prevent this from causing scheduler problems when the TPM
service decides to take a really long time?
I removed the create_ek_2048 operation at boot in favor of lazily
creating it on first use.

This attest protocol uses tpm_send_command under the hood and
demonstrates the problem.
When I use this for CreatePrimary for an RSA 2048 key, the vCPU goes
out to lunch

[ 3356.509143] Sending NMI from CPU 1 to CPUs 0:
[ 2503.241673] NMI backtrace for cpu 0
[ 2503.241673] CPU: 0 PID: 462 Comm: cat Not tainted 6.6.84 #1
[ 2503.241673] Hardware name: Google Google Compute Engine/Google
Compute Engine, BIOS Google 01/01/2011
[ 2503.241673] RIP: 0010:svsm_perform_call_protocol+0x1ee/0x310
[ 2503.241673] Code: c2 48 c1 ea 20 b9 30 01 01 c0 0f 30 48 8b 3b 48
8b 43 08 48 8b 4b 10 48 8b 53 18 4c 8b 43 20 4c 8b 4b 28 c6 07
01 f3 0f 01 d9 <48> 8b 3b 45 31 d2 44 86 17 48 89 43 30 48 89 4b 38 48
89 53 40 4c
[ 2503.241673] RSP: 0018:ffffc90000f93ba8 EFLAGS: 00000012
[ 2503.241673] RAX: 0000000080000000 RBX: ffffc90000f93c98 RCX:
000000013ffe8008
[ 2503.241673] RDX: ffffffffffffffff RSI: ffff88813ffe9000 RDI:
ffff88813ffe8000
[ 2503.241673] RBP: ffffc90000f93bf8 R08: ffffffffffffffff R09:
0000000000000000
[ 2503.241673] R10: 0000000000000000 R11: 0000000080000000 R12:
0000000080000018
[ 2503.241673] R13: ffff88813ffe93f0 R14: 00000000ffffffea R15:
ffff8881bffe9000
[ 2503.241673] FS:  00007d3490351800(0000) GS:ffff88813bc00000(0000)
knlGS:0000000000000000
[ 2503.241673] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2503.241673] CR2: 00007d349032f000 CR3: 00080001012d8003 CR4:
0000000000770ef0
[ 2503.241673] PKRU: 55555554
[ 2503.241673] Call Trace:
[ 2503.241673]  <NMI>
[ 2503.241673]  ? nmi_cpu_backtrace+0xe2/0x110
[ 2503.241673]  ? nmi_cpu_backtrace_handler+0x15/0x20
[ 2503.241673]  ? nmi_handle+0x7f/0x140
[ 2503.241673]  ? svsm_perform_call_protocol+0x1ee/0x310
[ 2503.241673]  ? default_do_nmi+0x46/0x100
[ 2503.241673]  ? exc_nmi+0x111/0x190
[ 2503.241673]  ? end_repeat_nmi+0x16/0x67
[ 2503.241673]  ? svsm_perform_call_protocol+0x1ee/0x310
[ 2503.241673]  ? svsm_perform_call_protocol+0x1ee/0x310
[ 2503.241673]  ? svsm_perform_call_protocol+0x1ee/0x310
[ 2503.241673]  </NMI>
[ 2503.241673]  <TASK>
[ 2503.241673]  snp_issue_svsm_attest_req+0xa7/0xf0
[ 2503.241673]  sev_report_new+0x58e/0xb20
[ 2503.241673]  ? srso_alias_return_thunk+0x5/0xfbef5
[ 2503.241673]  tsm_report_read+0x153/0x330
[ 2503.241673]  configfs_bin_read_iter+0xbf/0x200
[ 2503.241673]  ? srso_alias_return_thunk+0x5/0xfbef5
[ 2503.241673]  vfs_read+0x25e/0x2f0
[ 2503.241673]  ksys_read+0x75/0xe0
[ 2503.241673]  do_syscall_64+0x46/0xb0
[ 2503.241673]  entry_SYSCALL_64_after_hwframe+0x78/0xe2
[ 2503.241673] RIP: 0033:0x7d348ff281cd
[ 2503.241673] Code: 31 c0 e9 d6 fe ff ff 55 48 8d 3d a6 0a 0a 00 48
89 e5 e8 c6 1c 02 00 66 0f 1f 44 00 00 80 3d 31 62 0d 00 00 74
17 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 53 c3 66 2e 0f 1f 84 00 00 00 00
00 55 48 89
[ 2503.241673] RSP: 002b:00007ffc71e50a88 EFLAGS: 00000246 ORIG_RAX:
0000000000000000
[ 2503.241673] RAX: ffffffffffffffda RBX: 00007d3490330000 RCX:
00007d348ff281cd
[ 2503.241673] RDX: 0000000000020000 RSI: 00007d3490330000 RDI:
0000000000000003
[ 2503.241673] RBP: 00007ffc71e50ab0 R08: 00007d349032f010 R09:
0000000000000000
[ 2503.241673] R10: 0000000000000022 R11: 0000000000000246 R12:
0000000000020000
[ 2503.241673] R13: 0000000000000000 R14: 0000000000000003 R15:
0000000000020000
[ 2503.241673]  </TASK>


Which doesn't seem like behavior we want, nor is it something I have
any idea how we solve with the synchronous SVSM call model.

>  static struct platform_device sev_guest_device =3D {
>         .name           =3D "sev-guest",
>         .id             =3D -1,
> --
> 2.49.0
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
